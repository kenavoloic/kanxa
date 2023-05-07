const serie = document.querySelector('#serie');
const genre = document.querySelector('#genre');
const panneau = document.querySelector('#nombreEquipes');

const affiche = (chaine, sortie) => {
    sortie.value = chaine;    
}


const ecouteurs = () => {
    let _serie = serie.value;
    let _genre = genre.value;
    let sortie = document.querySelector('#nombreEquipes');

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

serie.addEventListener('change', ecouteurs);
genre.addEventListener('change', ecouteurs);
