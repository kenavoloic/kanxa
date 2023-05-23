import ecouteursMenus from './modules/ecouteursMenus.js';


document.addEventListener('DOMContentLoaded', () => {
    ecouteursMenus();

    const utilisateur =  document.querySelector('#utilisateur');
    if(utilisateur){
	utilisateur.focus({focusVisible: true});
    }
    
});
