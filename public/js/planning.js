import ecouteursMenus from './modules/ecouteursMenus.js';
import {nombre_p} from './modules/predicats.js';

//const nombre_p = /\d+/;

const range = nombre => [...Array(nombre).keys()];

const triPoule = (a,b) => a.pouleId - b.pouleId; 
const _getPoule = x => y => x.has(y) ? x.get(y).sort(triPoule) : 'vide';
//const nomPoule = chaine => 'p'+`${chaine}`.padStart(2, '0');
const nomPoule = chaine => 'p'.concat(`${chaine}`.padStart(2,'0'));


const reducteurTableau = (retour, x) => {
    let {equipeId, tournoiId, pouleId, nom1, prenom1, nom2, prenom2, souhait} = x;

    const dl = document.createElement('dl');

    dl.setAttribute('id',pouleId);
    dl.setAttribute('data-equipeId',equipeId);
    
    const dt = document.createElement('dt');
    dt.setAttribute('class','tournoiId');
    const dd1 = document.createElement('dd');
    const dd2 = document.createElement('dd');
    dd1.setAttribute('class','equipe');
    dd2.setAttribute('class','equipe');

    const dds = document.createElement('dd');
    dds.setAttribute('class','souhait');

    const spid = document.createElement('span');
    const sps = document.createElement('span');
    
    const sp1n = document.createElement('span');
    const sp1p = document.createElement('span');

    const sp2n = document.createElement('span');
    const sp2p = document.createElement('span');

    spid.setAttribute('class','spid');
    sps.setAttribute('class','sps');

    sp1n.setAttribute('class','nom');
    sp1p.setAttribute('class','prenom');
    
    sp2n.setAttribute('class','nom');
    sp2p.setAttribute('class','prenom');

    spid.appendChild(document.createTextNode(tournoiId));
    sps.appendChild(document.createTextNode(souhait));

    sp1n.appendChild(document.createTextNode(nom1));
    sp1p.appendChild(document.createTextNode(prenom1));

    sp2n.appendChild(document.createTextNode(nom2));
    sp2p.appendChild(document.createTextNode(prenom2));

    dd1.appendChild(sp1n);
    dd1.appendChild(sp1p);

    dd2.appendChild(sp2n);
    dd2.appendChild(sp2p);

    //dds.appendChild(document.createTextNode(souhait));
    dds.appendChild(sps);
    dt.appendChild(spid);

    dl.appendChild(dt);
    dl.appendChild(dds);
    dl.appendChild(dd1);
    dl.appendChild(dd2);

    retour.appendChild(dl);

    return retour;
    
};

const ecouteurPoule = (tableau, fonction) => {
    let liste = tableau.reduce(fonction, new DocumentFragment());
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

const creationPartie = (equipe1, equipe2, index, _options, ecouteur) => {

    // _options est cloné à chaque fois pour créer des options qui peupleront chacun des six select.
    // sans cela, impossible de peupler les six select.
    
    const options = _options.cloneNode(true);

    let nom = `${equipe1.tournoiId}_${equipe2.tournoiId}`;

    let affiche = `${equipe1.tournoiId} &mdash; ${equipe2.tournoiId}`;
    
    const dd = document.createElement('dd');
    dd.setAttribute('class','partie');
    dd.setAttribute('id', 'partie'.concat(`${index}`.padStart(4,'0')));

    const horaire = document.createElement('div');
    horaire.setAttribute('class','horaire');
    horaire.setAttribute('class','horaire');
    horaire.setAttribute('id', nom);

    const djj = document.createElement('div');
    const dhh = document.createElement('div');
    const dchoix = document.createElement('div');
    djj.setAttribute('class','itemFormulaire');
    dhh.setAttribute('class','itemFormulaire');
    dchoix.setAttribute('class','itemFormulaire');
    
    const jj = document.createElement('select');
    let zero = document.createElement('option');
    zero.setAttribute('disabled', true);
    zero.setAttribute('selected', true);
    zero.appendChild(document.createTextNode('Jour'));

    jj.appendChild(zero);
    jj.appendChild(options);
    
    const _jj = document.createElement('label');

    jj.setAttribute('id', `jj_${nom}`);
    _jj.setAttribute('for',`jj_${nom}`);
    _jj.appendChild(document.createTextNode("Jour"));
    _jj.setAttribute('data-court', 'J');
    _jj.setAttribute('data-long', 'Jour');

    djj.appendChild(_jj);
    djj.appendChild(jj);
    
    const hh = document.createElement('select');
    const _hh = document.createElement('label');

    hh.setAttribute('id', `hh_${nom}`);
    _hh.setAttribute('for',`hh_${nom}`);
    _hh.appendChild(document.createTextNode("Heure"));
    _hh.setAttribute('data-court', 'H');
    _hh.setAttribute('data-long', 'Heure');

    hh.appendChild(creationHeures());

    dhh.appendChild(_hh);
    dhh.appendChild(hh);
      
    const choix = document.createElement('input');
    const _choix = document.createElement('label');

    choix.setAttribute('id', `choix_${nom}`);
    choix.setAttribute('type','checkbox');
    choix.setAttribute('class','carre');
    
    _choix.setAttribute('for',`choix_${nom}`);
    _choix.appendChild(document.createTextNode("Oui"));

    dchoix.appendChild(_choix);
    dchoix.appendChild(choix);

    horaire.appendChild(djj);
    horaire.appendChild(dhh);
    horaire.appendChild(dchoix);

    const rencontre = document.createElement('div');
    rencontre.setAttribute('class','rencontre');
    const sp1 = document.createElement('span');
    const sp2 = document.createElement('span');
    sp1.setAttribute('class','e1');
    sp1.setAttribute('data-equipe', equipe1.equipeId);
    sp1.setAttribute('data-poule', equipe1.pouleId);
    sp2.setAttribute('class','e2');
    sp2.setAttribute('data-equipe', equipe2.equipeId);
    sp2.setAttribute('data-poule', equipe2.pouleId);
    sp1.appendChild(document.createTextNode(equipe1.tournoiId));
    sp2.appendChild(document.createTextNode(equipe2.tournoiId));
    rencontre.appendChild(sp1);
    rencontre.appendChild(sp2);
    dd.appendChild(rencontre);
    //dd.appendChild(sp1);
    //dd.appendChild(sp2);
    dd.appendChild(horaire);

    jj.addEventListener('change', ecouteur);
    
    return dd;
};

const reducteurListe = (retour, x) => {
    //let nom = 'p'+`${x.poule}`.padStart(2, '0');
    let nom = nomPoule(x.poule);
    //console.log([...retour]);
    //console.log(x);
    //console.log(nom);
    return retour.has(nom) ? retour.set(nom,  [x, ...retour.get(nom)]) : retour.set(nom, [x]);	
};

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
    return df;
};

const creationListeParties = (envoi, teams, options, ecouteur) => {

    let df = new DocumentFragment();
    const dl = document.createElement('dl');

    let pouleIds = teams.reduce((retour, x) => {
	retour.set(x.pouleId, x);
	return retour;
    }, new Map());

    envoi.forEach((x,index) => {
	let {equipe1, equipe2} = x;
	//let dd = creationPartie(pouleIds.get(equipe1), pouleIds.get(equipe2), index);
	let dd = creationPartie(pouleIds.get(equipe1), pouleIds.get(equipe2), index, options, ecouteur);
	dl.appendChild(dd);
    });
    
    df.appendChild(dl);
    return df;
};

const getOptionsPlanning = (envoi) => {
    let df = new DocumentFragment();
    let options = envoi.map(getOptionPlanning);
    options.forEach(x => df.appendChild(x));
    return df;
};

const getOptionPlanning = (envoi) => {
    let {numero, annee, jjmmaaaa} = envoi;
    let option = document.createElement('option');
    option.setAttribute('data-numero',numero);
    option.setAttribute('data-annee', annee);
    option.setAttribute('value', numero);
    //option.appendChild(document.createTextNode(jjmmaaaa));
    //le choix de innerHTML permet l'affichage de 1er alors qu'avec createTextNode => 1<sup>er</sup>
    option.innerHTML = jjmmaaaa;
    return option;
};

const creationHeures = () => {
    const df = new DocumentFragment();
    let zero = document.createElement('option');
    zero.setAttribute('selected', true);
    zero.setAttribute('disabled', true);
    zero.appendChild(document.createTextNode('HH:00'));
    df.appendChild(zero);
    
    let nombre = 11;
    const liste = range(nombre).map(x => x + 9);
    const options  = liste.map(x => {
	let d = document.createElement('option');
	d.setAttribute('value', x);
	d.appendChild(document.createTextNode(`${x}`.padStart(2,'0').concat('h00')));
	return d;
    });

   // console.log(options);
    options.forEach(x => df.appendChild(x));
    return df;
}

const ecouteurDate = (e) => {
    //console.log('écouteurDate => ', e.srcElement, e.target, e.selectedOptions[0]);
    //console.log('écouteurDate => ', e.srcElement.selectedOptions[e.selectedIndex]);
    //console.log(e.parent.selectedOptions[0]);
    //=> numéroJour et année
    let numero = e.target.value;
    let annee = e.srcElement.selectedOptions[0].dataset.annee;
    //console.log(e.target.value, e.srcElement.selectedOptions[0].dataset.annee);
    console.log(`${numero} ${annee}`);
};

document.addEventListener('DOMContentLoaded', () => {
    ecouteursMenus();

    const serie = document.querySelector('#serie');
    const genre = document.querySelector('#genre');
    const panneau = document.querySelector('#panneau');
    const poule = document.querySelector('#poule');
    const parties = document.querySelector('#parties');

    //let listeEquipes = null;

    //serie.addEventListener('change', ecouteurs);
    //genre.addEventListener('change', ecouteurs);

    const ppp = JSON.parse(document.querySelector('#partiesParPoule').textContent);
    const liste = JSON.parse(document.querySelector('#liste').textContent);

    const journees = JSON.parse(document.querySelector('#journees').textContent);
    //const optionsJours = getOptionsPlanning(journees);
    //const optionsJours = journees.map(getOptionsPlanning);
    const optionsJours = getOptionsPlanning(journees);
    //const clones = range(8).map(x => optionsJours.cloneNode(true));
    
    //console.log(optionsJours);
    //console.log(journees);

    const listeSerie_ = document.querySelector('#listeSerie').textContent;
    const listeGenre_ = document.querySelector('#listeGenre').textContent;
    const listeSerie = nombre_p(listeSerie_) ? listeSerie : 1; // par défaut, première série
    const listeGenre = nombre_p(listeGenre_) ? listeGenre : 1; // par défaut, tournoi masculin

    const identifiantsPoule = [...new Set(liste.map(x => nomPoule(x.poule)))].sort().map((x,index) => ({nom:x, numero: index+1}));
    
    const poules = liste.reduce(reducteurListe, new Map());
    const getPoule = _getPoule(poules);

    poule.replaceChildren(creationOptions(identifiantsPoule));

    poule.addEventListener('change', (e) => {
	let valeur = e.srcElement.value;
	//console.log(e.srcElement.options[e.srcElement.selectedIndex].text);
	//console.log(getPoule(valeur));
	//console.log(e.srcElement.value);
	let listeEquipes = getPoule(valeur);
	//console.log('listeEquipes => ', listeEquipes);

	ecouteurPoule(listeEquipes, reducteurTableau);
	parties.replaceChildren(creationListeParties(ppp, listeEquipes, optionsJours, ecouteurDate));
    });

    poule.dispatchEvent(new Event('change'));

});
