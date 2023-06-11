import ecouteursMenus from './modules/ecouteursMenus.js';

const nombre_p = /\d+/;

const reducteurTableau = (retour, x) => {
    let {equipeId, tournoiId, pouleId, nom1, prenom1, nom2, prenom2, souhait} = x;

    const dl = document.createElement('dl');

    dl.setAttribute('id',pouleId);
    dl.setAttribute('data-equipeId',equipeId);
    
    const dt = document.createElement('dt');
    const dd1 = document.createElement('dd');
    const dd2 = document.createElement('dd');

    const dds = document.createElement('dd');

    
    
    const sp1n = document.createElement('span');
    const sp1p = document.createElement('span');

    const sp2n = document.createElement('span');
    const sp2p = document.createElement('span');

    dt.appendChild(document.createTextNode(tournoiId));

    sp1n.setAttribute('class','nom');
    sp1p.setAttribute('class','prenom');
    
    sp2n.setAttribute('class','nom');
    sp2p.setAttribute('class','prenom');

    sp1n.appendChild(document.createTextNode(nom1));
    sp1p.appendChild(document.createTextNode(prenom1));

    sp2n.appendChild(document.createTextNode(nom2));
    sp2p.appendChild(document.createTextNode(prenom2));

    dd1.appendChild(sp1n);
    dd1.appendChild(sp1p);

    dd2.appendChild(sp2n);
    dd2.appendChild(sp2p);

    dds.appendChild(document.createTextNode(souhait));

    dl.appendChild(dt);
    dl.appendChild(dds);
    dl.appendChild(dd1);
    dl.appendChild(dd2);

    retour.appendChild(dl);

    return retour;
    
};

const ecouteurPoule = (tableau, fonction) => {
    let liste = tableau.reduce(fonction, new DocumentFragment());

    //const equipes = document.createElement('article');
    //equipes.appendChild(liste);
    //document.querySelector('#timetable').appendChild(equipes);
    document.querySelector('#equipes').replaceChildren(liste);
    
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
	//console.log(e.srcElement.options[e.srcElement.selectedIndex].text);
	//console.log(getPoule(valeur));
	//console.log(e.srcElement.value);
	ecouteurPoule(getPoule(valeur), reducteurTableau);
    });

    poule.dispatchEvent(new Event('change'));

});
