const serie = document.querySelector('#serie');
const genre = document.querySelector('#genre');
const nombre_p = /\d+/;

const ecouteurPoule = () => {
    let _serie = serie.value;
    let _genre = genre.value;
    let _poule = document.querySelector('#poule').value;
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
	    .then(reponse => equipes(JSON.parse(reponse)))
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

serie.addEventListener('change', ecouteurs);
genre.addEventListener('change', ecouteurs);

const equipe = envoi => {
    let {equipeId, pouleId, nom1, prenom1, nom2, prenom2} = envoi;
    //console.log(pouleId, nom1, prenom1, nom2, prenom2);
    console.log(pouleId, nom1, nom2);
};

const equipes = envoi => {
    envoi.forEach(x => equipe(x));
//	let {equipeId, pouleId, nom1, nom2} = envoi[0];
  //  console.log(pouleId, nom1, nom2);
    //console.log(envoi);
};
