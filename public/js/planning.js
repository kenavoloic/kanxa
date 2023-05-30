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
	fdata.append('listeSerie', _serie);
	fdata.append('listeGenre', _genre);

	fetch('/pilota/liste', {
	    method: 'POST',
	    mode: 'no-cors',
	    headers: {"Content-Type": "application/json"},
	    body: fdata
	})
	    .then(reponse => reponse.json())
	    .then(reponse => getOptionsPoules(reponse, ecouteurPoule))
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


    
});
