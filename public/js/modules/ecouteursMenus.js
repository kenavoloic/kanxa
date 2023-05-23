const tremor = [
    {transform: 'translateY(0) rotate(0)'},
    {transform: 'translateY(-1px) rotate(-3deg)'},
    {transform: 'translateY(1px) rotate(2deg)'},
    {transform: 'translateY(-2px) rotate(3deg)'},
    {transform: 'translateY(2px) rotate(2deg)'},
    {transform: 'translateY(-1px) rotate(1deg)'}
];

const dureeTremor = {duration: 2000, direction: "alternate", iterations: Infinity, easing: 'ease-in-out', fill: 'both'};


const ajoutEcouteursMenus = (vegan, navigation) => {
    let menuAnime = vegan.animate(tremor, dureeTremor);
    menuAnime.play();
    
    vegan.addEventListener('mouseover', () => {
	menuAnime.pause();
    });

    vegan.addEventListener('mouseout', () => {
	menuAnime.play();
    });

    vegan.addEventListener('click', (e) => {
	let valeur = navigation.getAttribute('data-afficher');

	if(valeur === "false"){
	    navigation.setAttribute('data-afficher', true);
	}

	if(valeur === "true"){
	    navigation.setAttribute('data-afficher', false);
	}

    });

};

const ecouteursMenus = () => {
    let vegan = document.querySelector('#vegan');
    let navigation = document.querySelector('nav > ul');

    if(vegan && navigation){
	ajoutEcouteursMenus(vegan, navigation);
    }
	
};

export default ecouteursMenus;
