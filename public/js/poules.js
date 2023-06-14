import ecouteursMenus from './modules/ecouteursMenus.js';

document.addEventListener('DOMContentLoaded', () => {

    //écouteurs pour la navbar
    ecouteursMenus();


    const listeBoutons = () => {

	let df = new DocumentFragment();
	let div = document.createElement('div');
	div.setAttribute('class', 'liste');

	let rouge = document.createElement('button');
	rouge.setAttribute('class','rouge');

	let vert = document.createElement('button');
	vert.setAttribute('class','vert');

	let bleu = document.createElement('button');
	bleu.setAttribute('class','bleu');

	let jaune = document.createElement('button');
	jaune.setAttribute('class','jaune');

	div.appendChild(rouge);
	div.appendChild(vert);
	div.appendChild(bleu);
	div.appendChild(jaune);
	df.appendChild(div);
	return df;
    };

    const couleurUnique = (couleur) => {
	let df = new DocumentFragment();
	let div = document.createElement('div');
	div.setAttribute('class','liste');
	let bouton = document.createElement('button');
	//    bouton.setAttribute('class',`${couleur}`);
	bouton.setAttribute('class', "supprimer");
	bouton.setAttribute('title', 'Supprimer');
	//bouton.textContent = "&Theta; &ominus;";
	//bouton.innerHTML = '&ominus;';
	//bouton.textContent = 'Supprimer';
	bouton.innerHTML = '&boxtimes;';
	div.appendChild(bouton);
	df.appendChild(div);
	return df;
    };

    const liste = new Map([['rouge','p1'], ['vert','p2'], ['bleu', 'p3'], ['jaune', 'p4']]);
    const clefs = Array.from(liste.keys());
    const valeurs = Array.from(liste.values());
    const tri = [];
    //const seize = Array.from(document.querySelectorAll('.ligne')).map(x => [x.id, ""]);
    const seize = Array.from(document.querySelectorAll('.equipe')).map(x => [x.id, ""]);
    const equipesInscrites = new Map(seize);
    //console.log([...equipesInscrites.keys()], [...equipesInscrites.values()]);

    if(document.querySelector('#equipes')){
	const equipes = document.querySelector('#equipes').addEventListener('click', (e) => {

	    //console.log('#equipes ', e.srcElement.parentElement);

	    if(e.srcElement.tagName === 'BUTTON'){
		let idParent = e.srcElement.parentElement.parentElement.id;
		let souhait = `#${idParent} span`;

		//La div list est retirée du parent
		// l'article.equipe est retiré du parent
		let ligneSupprimee = document.getElementById(idParent);
		ligneSupprimee.remove();

		//retrait de la div.liste de la ligne supprimée
		//ajout à celle-ci d'un nouvel élément
		ligneSupprimee.querySelector('div.liste').remove();
		//ligneSupprimee.querySelector('article.equipe').remove();

		ligneSupprimee.append(couleurUnique(e.srcElement.className));
		
		//Ajout dans l'article correspondant à liste.get(e.srcElement.className) :
		// p1, p2, p3 ou p4
		//console.log(idParent, liste.get(e.srcElement.className));
		//tri.push({poule:liste.get(e.srcElement.className), id: idParent});
		//console.log(idParent);
		if(equipesInscrites.has(idParent)){
		    equipesInscrites.set(idParent, liste.get(e.srcElement.className));
		}

		let valeurs = [...equipesInscrites.values()].filter(x => x!= "");

		if(valeurs.length === equipesInscrites.size){
		    //console.log("Brassage effectué ligne 86");
		    //document.querySelector("#brassageEffectue").setAttribute('class','sauvegardePossible');
		    document.querySelector("#brassageEffectue").disabled = false;
		    //document.querySelector("#brassageEffectue").addEventListener('click', (e) => validationPoules(valeurs, equipesInscrites));
		    let t = equipesInscrites.entries();
		    //console.log('ligne 94', [...t]);
		}
		document.getElementById(liste.get(e.srcElement.className)).appendChild(ligneSupprimee);
	    }
	});

	const poules = document.querySelectorAll('.depot').forEach(poule => {
	    poule.addEventListener('click', (e) => {
		if(e.srcElement.tagName === 'BUTTON'){
		    let idParent = e.srcElement.parentElement.parentElement.id;
		    let souhait = `#${idParent} span`;

		    let ligneSupprimee = document.getElementById(idParent);
		    ligneSupprimee.querySelector('div.liste').remove();
		    //ligneSupprimee.querySelector('article.liste').remove();
		    ligneSupprimee.append(listeBoutons());

		    if(equipesInscrites.has(idParent)){
			equipesInscrites.set(idParent, "");
		    }
		    document.getElementById('equipes').append(ligneSupprimee);
		}
	    });
	});

	const validationPoules = document.querySelector("#brassageEffectue").addEventListener('click', (e) => {
	    let total = equipesInscrites.size;
	    let valeurs = [...equipesInscrites.values()].filter(x => x!== "");
	    let serie = document.querySelector('#serie').value;
	    let genre = document.querySelector('#genre').value;

	    if(valeurs.length === total){
		//let _p1 = document.querySelectorAll('#p1 > .ligne');
		//let _p2 = document.querySelectorAll('#p2 > .ligne');
		//let _p3 = document.querySelectorAll('#p3 > .ligne');
		//let _p4 = document.querySelectorAll('#p4 > .ligne');
		
		let _p1 = document.querySelectorAll('#p1 > .equipe');
		let _p2 = document.querySelectorAll('#p2 > .equipe');
		let _p3 = document.querySelectorAll('#p3 > .equipe');
		let _p4 = document.querySelectorAll('#p4 > .equipe');

		let p1 = [..._p1].map(x => `1:${x.id}`);
		let p2 = [..._p2].map(x => `2:${x.id}`);
		let p3 = [..._p3].map(x => `3:${x.id}`);
		let p4 = [..._p4].map(x => `4:${x.id}`);
		
		let r1 = [...p1, ...p2, ...p3, ...p4];
		
		let rp1 = `1:${[..._p1].map(x => x.id).join(',')}`;
		let rp2 = `2:${[..._p2].map(x => x.id).join(',')}`;
		let rp3 = `3:${[..._p3].map(x => x.id).join(',')}`;
		let rp4 = `4:${[..._p4].map(x => x.id).join(',')}`;
		let r2 = [rp1, rp2, rp3, rp4].join('|');

		let retour = `${serie},${genre}@${r1}@${r2}`;
		
		let fd = new FormData();
		fd.append('liste', retour);

	    	fetch('/poules/liste', {
		    method: 'POST',
		    mode: 'no-cors',
		    headers: {"Content-Type": "application/json"},
		    body: fd
		});
		/* .then(reponse => reponse.json())
		   .then(reponse => console.log(reponse)); */

		// devrait fonctionner 
		document.querySelector("#brassageEffectue").removeEventListener('click', (e) => {
		    document.querySelector("#brassageEffectue").disabled = false;
		});

	    }
	});
    }
});
