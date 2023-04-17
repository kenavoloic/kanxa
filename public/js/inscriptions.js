
if(document.querySelector('#inscription')){

    const formulaire = document.querySelector('form');
    const serie_ = document.querySelector('#serie');
    const genre_ = document.querySelector('#genre');
    const panneau = document.querySelector('#nombre');
    let serie = serie_.value;
    let genre = genre_.value;
    
    formulaire.addEventListener('change', (e) => {
	e.preventDefault();
	serie = serie_.value;
	genre = genre_.value;
    }
}
