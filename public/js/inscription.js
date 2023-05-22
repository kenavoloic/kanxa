
const razOptionCachee = (selecteur) => {
    // L'option [0] n'est affichée qu'une seule fois.
    let options = [...selecteur.options];
    options[0].setAttribute('hidden','true');
}

const affiche = (chaine, sortie) => {
    sortie.value = chaine;    
}

const soumission = (e) => {
    // Refuse la soumission du formulaire si les contraintes ne sont respectées
    // De toute façon, les données seront nettoyées en php
    if(!e.target.checkValidity()){
	e.preventDefault();
    }
};

const animationPanneau = (e) => {
    let source = e.target;
    console.log('animationPanneau ', source);
};

const ecouteurSelecteursSortie = (idSelect1, idSelect2, idSortie, nomVariable1, nomVariable2, controleurMethode) => {
    // retourne une fonction qui permettra d'écouter les événements sur les deux sélects et affichera un message sur l'élément sortie.
    // l'élément sortie étant désactivé, l'écouteur d'événement sera sur son parent

    let serie = document.querySelector(`#${idSelect1}`);
    let genre = document.querySelector(`#${idSelect2}`);
    let sortie = document.querySelector(`#${idSortie}`);
    //let parent = sortie.parentNode;

    

    return  (e) => {
	let _serie = serie.value;
	let _genre = genre.value;
	//let sortie = document.querySelector('#nombreEquipes');

	//couleurs options select : serie/genre
	if(e.target.tagName === 'SELECT' && e.target.selectedIndex > 0){
	    let identifiant = e.target.id;
	    let index = e.target.selectedIndex;
	    let options = [...e.target.options];
	    let choix = options[index];
	    options.forEach(x => x.classList.remove('vert'));
	    //choix.classList.add('vert');
	    document.querySelector(`#${identifiant}`).classList.add('vert');
	}

	//requête ajax si les deux selects sont activés
	if(_serie > 0  && _genre > 0){

	    let fdata = new FormData();
	    //fdata.append('inscriptionSerie', _serie);
	    //fdata.append('inscriptionGenre', _genre);

	    fdata.append(nomVariable1, _serie);
	    fdata.append(nomVariable2, _genre);

	    
	    fetch(controleurMethode, {
		method: 'POST',
		mode: 'no-cors',
		headers: {"Content-Type": "application/json"},
		body: fdata
	    })
		.then(reponse => reponse.json())
		.then(reponse => affiche(reponse, sortie));
		//.then(x => animation.play());
		//.then(() => sortie.animate(fx1,dur1));

	    //panneau.animate(fx1, dur1);
	}
    };
};


document.addEventListener('DOMContentLoaded', () => {
    //éléments
    const formulaire = document.querySelector('#formulaire');
    //formulaire.setAttribute('novalidate', true);
    const serie = document.querySelector('#serie');
    const genre = document.querySelector('#genre');
    const panneau = document.querySelector('#nombreEquipes');
    const compteur = panneau.parentNode;

    const fx1 = [{color: 'yellow', background: 'black'}, {color: 'black', background: 'green'}];
    const dur1 = {duration: 1000, delay: 0, iterations: 13, easing: 'ease-in-out'};
    //const animation = sortie.animate(fx1, dur1);


    let ecouteurAjax = ecouteurSelecteursSortie('serie','genre','nombreEquipes', 'inscriptionSerie', 'inscriptionGenre', '/pilota/inscription');

    serie.addEventListener('change', ecouteurAjax);
    genre.addEventListener('change', ecouteurAjax);
    //panneau.addEventListener('change', animationPanneau);
    compteur.addEventListener('change', animationPanneau);
    
    
    // parce que pour une raison inconnue, impossible d'appliquer cet attribut depuis php
    // cf /Vues/OutilsVues.php
    razOptionCachee(serie);
    razOptionCachee(genre);

    nom1.focus({focusVisible:true});

    formulaire.addEventListener('submit', soumission);
});
