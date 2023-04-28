document.addEventListener('DOMContentLoaded', () => {

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
    const seize = Array.from(document.querySelectorAll('.ligne')).map(x => [x.id, ""]);
    const equipesInscrites = new Map(seize);
    //console.log([...equipesInscrites.keys()], [...equipesInscrites.values()]);

    const equipes = document.querySelector('#equipes').addEventListener('click', (e) => {

	if(e.srcElement.tagName === 'BUTTON'){
	    let idParent = e.srcElement.parentElement.parentElement.id;
	    let souhait = `#${idParent} span`;

	    //console.log(idParent);

	    //La div list est retirée du parent 
	    let ligneSupprimee = document.getElementById(idParent);
	    ligneSupprimee.remove();

	    //retrait de la div.liste de la ligne supprimée
	    //ajout à celle-ci d'un nouvel élément
	    ligneSupprimee.querySelector('div.liste').remove();
	    //console.log('ligne 73 => ',e.srcElement.ClassName);
	    ligneSupprimee.append(couleurUnique(e.srcElement.className));
	    
	    //Ajout dans l'article correspondant à liste.get(e.srcElement.className) :
	    // p1, p2, p3 ou p4
	    //console.log(idParent, liste.get(e.srcElement.className));
	    //tri.push({poule:liste.get(e.srcElement.className), id: idParent});
	    //console.log(idParent);
	    if(equipesInscrites.has(idParent)){
		//equipesInscrites.set(equipesInscrites.get(idParent), "${liste.get(e.srcElement.className)}");
		equipesInscrites.set(idParent, liste.get(e.srcElement.className));
	    }

	    let valeurs = [...equipesInscrites.values()].filter(x => x!= "");
	    //console.log(valeurs, equipesInscrites.size);
	    if(valeurs.length === equipesInscrites.size){
		//console.log("Brassage effectué ligne 86");
		document.querySelector("#brassageEffectue").setAttribute('class','sauvegardePossible');
		document.querySelector("#brassageEffectue").disabled = false;
		//document.querySelector("#brassageEffectue").addEventListener('click', (e) => validationPoules(valeurs, equipesInscrites));
		let t = equipesInscrites.entries();
		//console.log([...t]);
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
		ligneSupprimee.append(listeBoutons());

		if(equipesInscrites.has(idParent)){
		    equipesInscrites.set(idParent, "");
		}
		//console.log('Sortie ', equipesInscrites);
		document.getElementById('equipes').append(ligneSupprimee);
	    }
	});
    });

    const validationPoules = document.querySelector("#brassageEffectue").addEventListener('click', (e) => {
	let total = equipesInscrites.size;
	let valeurs = [...equipesInscrites.values()].filter(x => x!== "");
	//console.log(valeurs, total);
	if(valeurs.length === total){
	    //console.log("Sauvegarde possible");
	    //return;
	    let p1 = [...document.querySelectorAll('#p1 > .ligne')].map(x => `1:${x.id}`);
	    let p2 = [...document.querySelectorAll('#p2 > .ligne')].map(x => `2:${x.id}`);
	    let p3 = [...document.querySelectorAll('#p3 > .ligne')].map(x => `3:${x.id}`);
	    let p4 = [...document.querySelectorAll('#p4 > .ligne')].map(x => `4:${x.id}`);
	    let retour = [...p1, ...p2, ...p3, ...p4];
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

	    
	    //console.log(valeurs);
	}
	//alert("Sauvegard impossible");
	//alert("Sauvegarde impossible, seulement " + valeurs.length + " équipes sur " + total);
    });

});
