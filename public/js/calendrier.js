import ecouteursMenus from './modules/ecouteursMenus.js';

const partie = envoi => {

    let equipe1 = envoi.getAttribute('data-equipe1');
    let equipe2 = envoi.getAttribute('data-equipe2');
    let serie = envoi.getAttribute('data-serie');
    let genre = envoi.getAttribute('data-genre');
    let jour = envoi.getAttribute('data-jour');
    let heure = envoi.getAttribute('data-heure');
    let versus = `${equipe1} – ${equipe2}`;

    let df = new DocumentFragment();

    let dt = document.createElement('dt');
    genre === "1" ? envoi.setAttribute('class','homme') : envoi.setAttribute('class','femme');

    let span = document.createElement('span');
    span.appendChild(document.createTextNode(versus));

    dt.appendChild(span);

    //let ddSerie = document.createElement('dd');
    //ddSerie.setAttribute('serie', ddSerie);


    let ddJour = document.createElement('dd');
    ddJour.setAttribute('class','jour');
    ddJour.appendChild(document.createTextNode(jour));

    let ddHeure = document.createElement('dd');
    ddHeure.setAttribute('class','heure');
    ddHeure.appendChild(document.createTextNode(heure));
    
    df.appendChild(dt);
    df.appendChild(ddJour);
    df.appendChild(ddHeure);
    envoi.appendChild(df);
};



document.addEventListener('DOMContentLoaded', () => {

    ecouteursMenus();

    const liste = document.querySelector('#liste');
    const dls = liste.querySelectorAll('dl').forEach(x => partie(x));

    
});
