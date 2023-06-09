import ecouteursMenus from './modules/ecouteursMenus.js';

const nombre_p = /\d+/;

const ecouteurPoule = () => {
    let _serie = serie.value;
    let _genre = genre.value;
    let _poule = document.querySelector('#poule').value;
    let sortie = document.querySelector('#panneau');
    if(_serie > 0 && _genre > 0 &&  _poule > 0){
	let fdata = new FormData();
	fdata.append('listeSerie', _serie);
	fdata.append('listeGenre', _genre);
	fdata.append('listePoule', _poule);
	fetch('/pilota/equipes', {
	    method: 'POST',
	    mode: 'no-cors',
	    headers: {"Content-Type": "application/json"},
	    body: fdata
	})
	    .then(reponse => reponse.json())
	    .then(reponse => equipes(JSON.parse(reponse), sortie))
    }
};

const ecouteurs = () => {
    let _serie = serie.value;
    let _genre = genre.value;

    if(_serie > 0  && _genre > 0){
	let fdata = new FormData();
	fdata.append('planningSerie', _serie);
	fdata.append('planningGenre', _genre);

	fetch('/pilota/tournoi', {
	    method: 'POST',
	    mode: 'no-cors',
	    headers: {"Content-Type": "application/json"},
	    body: fdata
	})
	    .then(reponse => reponse.json())
	    .then(reponse => document.querySelector('#liste').replaceChildren(reponse))
    }
};

const option = valeur => {
    let retour = document.createElement('option');
    retour.value = valeur;
    retour.text = valeur;
    return retour;
}


const getOptionsPoules = (tableau, ecouteur) => {
    let selecteur = document.querySelector('#poule');
    // Suppression des poules qui existeraient
    // Pas très élégant mais efficace
    while(selecteur.options.length > 0){
	selecteur.remove(0);
    }

    
    let zero = document.createElement('option');
    zero.value = 0;
    zero.text = "Poule";
    zero.disabled = true;
    zero.selected = true;
    
    let liste = tableau.map(option);

    let df = new DocumentFragment();
    let options = [zero, ...liste];
    options.forEach(x => df.appendChild(x));
    selecteur.append(df);
    selecteur.addEventListener('change', ecouteur);
};



document.addEventListener('DOMContentLoaded', () => {
    ecouteursMenus();

    const serie = document.querySelector('#serie');
    const genre = document.querySelector('#genre');
    const panneau = document.querySelector('#panneau');

    serie.addEventListener('change', ecouteurs);
    genre.addEventListener('change', ecouteurs);
    
    const liste_ = document.querySelector('#liste').textContent;
    const liste = JSON.parse(liste_);

    const triPoule = (a,b) => a.pouleId - b.pouleId; 
    const _getPoule = x => y => x.has(y) ? x.get(y).sort(triPoule) : 'vide';

    const reducteurListe = (retour, x) => {
	let nom = 'p'+`${x.poule}`.padStart(2, '0');
	return retour.has(nom) ? retour.set(nom,  [x, ...retour.get(nom)]) : retour.set(nom, [x]);	
    };

    const poules = liste.reduce(reducteurListe, new Map());
    
    /*    
    const poules = liste.reduce((retour, x) => {
	let nom = 'p'+`${x.poule}`.padStart(2, '0');
	return retour.has(nom) ? retour.set(nom,  [x, ...retour.get(nom)]) : retour.set(nom, [x]);
    }, new Map());
    */

    const getPoule = _getPoule(poules);

    //console.log(getPoule('p01'));
    //console.log(getPoule('p03'));


    
});
