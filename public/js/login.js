import ecouteursMenus from './modules/ecouteursMenus.js';


document.addEventListener('DOMContentLoaded', () => {
    ecouteursMenus();

    const utilisateur =  document.querySelector('#utilisateur');
    const courriel =  document.querySelector('#courriel');
    const mpasse =  document.querySelector('#mpasse');
    if(utilisateur){
	utilisateur.focus({focusVisible: true});
    }

    /*
    utilisateur.addEventListener('invalid', (e) => {
	document.getElementById(e.srcElement.id).setCustomValidity('Au moins une lettre.');
    });

    utilisateur.addEventListener('valid', (e) => {
	document.getElementById(e.srcElement.id).setCustomValidity('');
    });


    courriel.addEventListener('invalid', (e) => {
	document.getElementById(e.srcElement.id).setCustomValidity('Le format de courriel n’est pas valide.');
    });

    courriel.addEventListener('valid', (e) => {
	document.getElementById(e.srcElement.id).setCustomValidity('');
    });


    mpasse.addEventListener('invalid', (e) => {
	document.getElementById(e.srcElement.id).setCustomValidity('Au moins 1 caractère.');
    });

    mpasse.addEventListener('valid', (e) => {
	document.getElementById(e.srcElement.id).setCustomValidity('');
    });
*/
    
});
