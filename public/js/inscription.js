// Prédicats pour la validation
const nom_p = envoi => /^[a-zA-ZŽžÀ-ÿ\s'-]+$/.test(envoi);
const prenom_p = envoi => envoi.length ===0 ? false : /^[a-zA-ZŽžÀ-ÿ\s'-]+$/.test(envoi); // lettres + espace et apostrophe droite
const courriel_p = envoi => /^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(envoi); // tout sauf @ et espace
const telephone_p = envoi => /^[\d\s.:\/-]+$/.test(envoi); // chiffres et . : / et -
const nombre_p = envoi => /^[\d]+$/.test(envoi);
const serie_p = envoi => /^[1-9][ab]?$/.test(envoi); // 1, 1a, 1b, 2, 2a, 2b, 3 ...
const genre_p = envoi => /^[123]$/.test(envoi);
const souhait_p = envoi => /^[1-3]$/.test(envoi); // Trois voeux uniquement
//éléments
const formulaire = document.querySelector('form');
//formulaire.setAttribute('novalidate', true);

const serie = document.querySelector('#serie');
const genre = document.querySelector('#genre');
const panneau = document.querySelector('#nombreEquipes');

const nom1 = document.querySelector('#nom1');
const prenom1 = document.querySelector('#prenom1');
const courriel1 = document.querySelector('#courriel1');
const telephone1 = document.querySelector('#telephone1');
const licence1 = document.querySelector('#licence1');



/* nom1.addEventListener('invalid', (e) => {
 *     e.target.setCustomValidity('Un pelotari sans nom ?');
 * }); */

/* nom1.setCustomValidity('Un pelotari sans nom ?');
 * prenom1.setCustomValidity('Un pelotari sans prenom ?');
 * courriel1.setCustomValidity('Pas de courriel ? Comment lui envoyer le programme des parties ?');
 * telephone1.setCustomValidity('Numéro de mobile ?');
 *  */
const nom2 = document.querySelector('#nom2');
const prenom2 = document.querySelector('#prenom2');
const courriel2 = document.querySelector('#courriel2');
const telephone2 = document.querySelector('#telephone2');
const licence2 = document.querySelector('#licence2');

/* nom2.setCustomValidity('Un pelotari sans nom ?');
 * prenom2.setCustomValidity('Un pelotari sans prenom ?');
 * courriel2.setCustomValidity('Pas de courriel ? Comment lui envoyer le programme des parties ?');
 * telephone2.setCustomValidity('Numéro de mobile ?');
 *  */
//fonctions
const affiche = (chaine, sortie) => {
    sortie.value = chaine;    
}

const ecouteurs = (e) => {
    let _serie = serie.value;
    let _genre = genre.value;
    let sortie = document.querySelector('#nombreEquipes');

    //console.log('e => ',e.target.selectedIndex);

    if(e.target.tagName === 'SELECT' && e.target.selectedIndex > 0){
	let identifiant = e.target.id;
	let index = e.target.selectedIndex;
	let options = [...e.target.options];
	let choix = options[index];
	options.forEach(x => x.classList.remove('vert'));
	choix.classList.add('vert');
	document.querySelector(`#${identifiant}`).classList.add('vert');
    }

    if(e.target.tagName === 'SELECT' && e.target.selectedIndex == 0){
	let identifiant = e.target.id;
	let options = [...e.target.options];
	options.forEach(x => x.classList.remove('vert'));
	document.querySelector(`#${identifiant}`).classList.remove('vert');
	document.querySelector(`#${identifiant}`).classList.add('rouge');
	sortie.value = "";
    }

    /* 
     *     if(e.target.id === 'serie' && e.target.selectedIndex > 0){
     * 	let index = e.target.selectedIndex;
     * 	let options = [...e.target.options];
     * 	let choix = options[index];
     * 	options.forEach(x => x.classList.remove('vert'));
     * 	document.querySelector(`#${e.target.id}`).classList.add('vert');
     *     }
     * 
     *     if(e.target.id === 'genre' && e.target.selectedIndex > 0){
     * 	let index = e.target.selectedIndex;
     * 	let options = [...e.target.options];
     * 	let choix = options[index];
     * 	options.forEach(x => x.classList.remove('vert'));
     * 	document.querySelector(`#${e.target.id}`).classList.add('vert');
     *     } */

    if(_serie > 0  && _genre > 0){

	let fdata = new FormData();
	fdata.append('inscriptionSerie', _serie);
	fdata.append('inscriptionGenre', _genre);

	fetch('/pilota/inscription', {
	    method: 'POST',
	    mode: 'no-cors',
	    headers: {"Content-Type": "application/json"},
	    body: fdata
	})
	    .then(reponse => reponse.json())
	    .then(reponse => affiche(reponse, sortie))
    }
};



const validation = (e) => {

    console.log('Validation du formulaire');

    if(!formulaire.checkValidity()){
	e.preventDefault();
    }
    
    const souhait_ = document.querySelector('input[type=radio]:checked');

    let s = serie.value.trim();
    let g = genre.value.trim();

    let souhait = souhait_.value.trim();

    let n1 = nom1.value.trim();
    let p1 = prenom1.value.trim();
    let c1 = courriel1.value.trim();
    let t1 = telephone1.value.trim();
    let l1 = licence1.value.trim();

    let n2 = nom2.value.trim();
    let p2 = prenom2.value.trim();
    let c2 = courriel2.value.trim();
    let t2 = telephone2.value.trim();
    let l2 = licence2.value.trim();

    if(!serie_p(s)){
	serie.setCustomValidity('Dans quelle série ?');
    } else {
	serie.setCustomValidity('');	
    }

    if(!genre_p(g)){
	genre.setCustomValidity('Quel tournoi ? Masculin, féminin, mixte ?');
    } else {
	genre.setCustomValidity('');	
    }


    if(!souhait_p(souhait)){
	souhait_.setCustomValidity('Merci d’effectuer un choix quant aux dates');
    } else {
	souhait_.setCustomValidity('');
    }

    if(n1.length === 0){
	nom1.setCustomValidity('Au moins une lettre');
    } else {
	nom1.setCustomValidity('');
    }

    if(!nom_p(n1)){
	nom1.setCustomValidity('Un pelotari sans nom ?');
    } else {
	nom1.setCustomValidity('');
    }

    if(!prenom_p(p1)){
	prenom1.setCustomValidity('Un pelotari sans prenom ?');
    } else {
	prenom1.setCustomValidity('');
    }

    if(!courriel_p(c1)){
	courriel1.setCustomValidity('Pas de courriel ? Comment lui envoyer le programme des parties ?');
    } else {
	courriel1.setCustomValidity('');
    }

    // Si le numéro de téléphone contient autre chose que des chiffres et . : / - => erreur
    // Permet d'accepter un numéro de téléphone non renseigné
    if(!telephone_p(t1)){
	telephone1.setCustomValidity('Numéro de mobile ?');
    } else {
	telephone1.setCustomValidity('');
    }
    
    if(!nom_p(n2)){
	nom2.setCustomValidity('Un pelotari sans nom ?');
    } else {
	nom2.setCustomValidity('');
    }

    if(!prenom_p(p2)){
	prenom2.setCustomValidity('Un pelotari sans prenom ?');
    } else {
	prenom2.setCustomValidity('');
    }

    if(!courriel_p(c2)){
	courriel2.setCustomValidity('Pas de courriel ? Comment lui envoyer le programme des parties ?');
    } else {
	courriel2.setCustomValidity('');
    }
    
    if(!telephone_p(t2)){
	telephone2.setCustomValidity('Numéro de mobile ?');
    } else {
	telephone2.setCustomValidity('');
    }


};

const envoiFormulaire_p = (e) => {
    if(!formulaire.checkValidity()){
	e.preventDefault();
    }
};

serie.addEventListener('change', ecouteurs);
genre.addEventListener('change', ecouteurs);
//validation();
//formulaire.addEventListener('submit', envoiFormulaire_p);
formulaire.addEventListener('submit', validation);

/* nom1.addEventListener('input', (e) => {
 *     console.log(e.target.validity, e.target.checkValidity());
 * });
 * 
 * serie.addEventListener('change', (e) => {
 *     console.log(e.target, e.target.validity);
 * }); */
