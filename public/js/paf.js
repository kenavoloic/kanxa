document.addEventListener('DOMContentLoaded', () => {

    const formulaire = document.querySelector('#formulaire');
    const serie = document.querySelector('#serie');
    const genre = document.querySelector('#genre');
    const evenement = new Event('change');


    const ecouteurs = (e) => {
	let s = serie.value;
	let g = genre.value;

	let fdata = new FormData(formulaire);
	fdata.append('serie', serie);
	fdata.append('genre', genre);

	fetch('/paf/liste', {
	    method: 'POST',
	    mode: 'no-cors',
	    headers: {"Content-Type": "application/json"},
	    body: fdata
	})
	    .then(reponse => reponse.json())
	    .then(reponse => console.log(reponse));
	    //.catch(console.log('Erreur'));
    };

    serie.addEventListener('change', ecouteurs);
    genre.addEventListener('change', ecouteurs);
    /* serie.dispatchEvent(evenement);
     * genre.dispatchEvent(evenement); */

});
