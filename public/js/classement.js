import ecouteursMenus from './modules/ecouteursMenus.js';

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


const ranking = envoi => {
    let {tournoiId, equipeId, nom1, prenom1, nom2, prenom2, j, v, d, p, totalPoints} = envoi;

    let df1 = new DocumentFragement();
    let df2 = new DocumentFragement();

    let dl = document.createElement('dl');
    let dt = document.createElement('dt');
    let dd1 = document.createElement('dd');
    let dd2 = document.createElement('dd');
    let dd3 = document.createElement('dd');
    let dd4 = document.createElement('dd');

    dl.setAttribute('class','equipe');
    dl.setAttribute('id',pouleId);

    dt.appendChild(document.createTextNode(tournoiId));
    dd1.appendChild(document.createTextNode(nom1));
    dd2.appendChild(document.createTextNode(prenom1));
    dd3.appendChild(document.createTextNode(nom2));
    dd4.appendChild(document.createTextNode(prenom2));

    dl.appendChild(dt);
    dl.appendChild(dd1);
    dl.appendChild(dd2);
    dl.appendChild(dd3);
    dl.appendChild(dd4);
    df1.appendChild(dl);

    
    let tr = document.createElement('tr');
    let td1 = document.createElement('td');
    let td2 = document.createElement('td');
    let td3 = document.createElement('td');
    let td4 = document.createElement('td');
    let td5 = document.createElement('td');
    let td6 = document.createElement('td');
    td1.appendChild(document.createTextNode(tournoiId));
    td2.appendChild(document.createTextNode(j));
    td3.appendChild(document.createTextNode(v));
    td4.appendChild(document.createTextNode(d));
    td5.appendChild(document.createTextNode(p));
    td6.appendChild(document.createTextNode(totalPoints));
    tr.appendChild(td1);
    tr.appendChild(td2);
    tr.appendChild(td3);
    tr.appendChild(td4);
    tr.appendChild(td5);
    tr.appendChild(td6);
    df2.appendChild(tr);

    return {dl:df1, tr:df2}
};
