const serie = document.querySelector('#serie');
const genre = document.querySelector('#genre');
const nombre_p = /\d+/;

const ecouteurs = () => {
    let _serie = serie.value;
    let _genre = genre.value;
    //console.log(_serie, _genre);
    if(nombre_p.test(_serie)  && nombre_p.test(_genre)){
	let fdata = new FormData();
	fdata.append('serie', _serie);
	fdata.append('genre', _genre);

	fetch('/liste/equipes', {
	    method: 'POST',
	    mode: 'no-cors',
	    headers: {"Content-Type": "application/json"},
	    body: fdata
	})
	    .then(reponse => reponse.json())
	    .then(reponse => console.log(reponse))
    }
};



serie.addEventListener('change', ecouteurs);
genre.addEventListener('change', ecouteurs);
