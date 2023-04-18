
if(document.querySelector('#inscription')){

    const formulaire = document.querySelector('form');
    const serie_ = document.querySelector('#serie');
    const genre_ = document.querySelector('#genre');
    const panneau = document.querySelector('#nombreEquipes');
    let serie = serie_.value;
    let genre = genre_.value;
    
    formulaire.addEventListener('change', (e) => {
	e.preventDefault();
	serie = serie_.value;
	genre = genre_.value;
	let fdata = new FormData();
	fdata.append('serie', serie);
	fdata.append('genre', genre);

	fetch('/pilota/inscriptions', {
	    method: 'POST',
	    mode: 'no-cors',
	    headers: {"Content-Type": "application/json"},
	    body: fdata
	})
	    .then(reponse => reponse.json())
	    .then(reponse => panneau.value = reponse)
	    .catch(console.log);
        });
}
