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
    const poule = document.querySelector('#poule');

    //serie.addEventListener('change', ecouteurs);
    //genre.addEventListener('change', ecouteurs);
    
    const liste_ = document.querySelector('#liste').textContent;
    const liste = JSON.parse(liste_);

    const triPoule = (a,b) => a.pouleId - b.pouleId; 
    const _getPoule = x => y => x.has(y) ? x.get(y).sort(triPoule) : 'vide';

    const nomPoule = chaine => 'p'+`${chaine}`.padStart(2, '0');

    const reducteurListe = (retour, x) => {
	//let nom = 'p'+`${x.poule}`.padStart(2, '0');
	let nom = nomPoule(x.poule);
	//console.log([...retour]);
	//console.log(x);
	//console.log(nom);
	return retour.has(nom) ? retour.set(nom,  [x, ...retour.get(nom)]) : retour.set(nom, [x]);	
    };

    //const identifiantsPoule = [...new Set(liste.map(x => 'p'+`${x.poule}`.padStart(2, '0')))];
    const identifiantsPoule = [...new Set(liste.map(x => nomPoule(x.poule)))].map((x,index) => ({nom:x, numero: index+1}));
    //const identifiantsPoule = [...new Set(liste.map(x => ({numero:x.poule, nom:nomPoule(x.poule)})))];
    //console.log(identifiantsPoule);
    
    const poules = liste.reduce(reducteurListe, new Map());

    //console.log([...poules]);

    //console.log(liste);
    
    const getPoule = _getPoule(poules);

    const creationOptionPoule = ({nom, numero}) => {
	let option = document.createElement('option');
	option.setAttribute('value', nom);
	option.appendChild(document.createTextNode(numero));
	return option;
    };

    const creationOptions = liste => {
	let df = new DocumentFragment();
	let options = liste.map(creationOptionPoule);
	options.forEach(x => df.appendChild(x));
	//df.appendChild(options);
	return df;
    };

    //document.querySelector('#poule').replaceChildren(creationOptions(identifiantsPoule));
    poule.replaceChildren(creationOptions(identifiantsPoule));
    //console.log(getPoule('p01'));
    //console.log(getPoule('p03'));

    poule.addEventListener('change', (e) => {
	let valeur = e.srcElement.value;
	//console.log(e.target, e.srcElement);
	console.log(e.srcElement.options[e.srcElement.selectedIndex].text);
	console.log(getPoule(valeur));
	//console.log(e.srcElement.value);
    });

    poule.dispatchEvent(new Event('change'));

});
