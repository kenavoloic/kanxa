const creationEquipe = envoi => {
    let {tournoiId, equipeId, pouleId, nom1, prenom1, courriel1, licence1, mobile1, nom2, prenom2, courriel2, licence2, mobile2} = envoi;

    let df = new DocumentFragment();

    let dl = document.createElement('dl');
    
    let tId = document.createElement('dt');
    
    let n1 = document.createElement('dt');
    let n2 = document.createElement('dt');

    let p1 = document.createElement('dd');
    let p2 = document.createElement('dd');

    let l1 = document.createElement('dd');
    let l2 = document.createElement('dd');

    let c1 = document.createElement('dd');
    let c2 = document.createElement('dd');

    let m1 = document.createElement('dd');
    let m2 = document.createElement('dd');

    let v = document.createElement('a');
    let m = document.createElement('a');
    
    let _tId = document.createTextNode(tournoiId);

    let _nom1 = document.createTextNode(nom1);
    let _nom2 = document.createTextNode(nom2);

    let _prenom1 = document.createTextNode(prenom1);
    let _prenom2 = document.createTextNode(prenom2);

    let _licence1 = document.createTextNode(licence1);
    let _licence2 = document.createTextNode(licence2);

    let _courriel1 = document.createTextNode(courriel1);
    let _courriel2 = document.createTextNode(courriel2);

    let _mobile1 = document.createTextNode(mobile1);
    let _mobile2 = document.createTextNode(mobile2);

    let _voir = document.createTextNode('Voir');
    let _modifier = document.createTextNode('Modifier');

    m.href="#";
    m.appendChild(_modifier);

    v.href="#";
    v.appendChild(_voir);

    
    tId.appendChild(_tId);
    n1.appendChild(_nom1);
    n2.appendChild(_nom2);

    p1.appendChild(_prenom1);
    p2.appendChild(_prenom2);

    l1.appendChild(_licence1);
    l2.appendChild(_licence2);

    c1.appendChild(_courriel1);
    c2.appendChild(_courriel2);
    
    m1.appendChild(_mobile1);
    m2.appendChild(_mobile2);
    
    dl.appendChild(tId);
    dl.appendChild(n1);
    dl.appendChild(p1);
    dl.appendChild(l1);
    dl.appendChild(c1);
    dl.appendChild(m1);
    
    dl.appendChild(n2);  
    dl.appendChild(p2);
    dl.appendChild(l2);
    dl.appendChild(c2);
    dl.appendChild(m2);

    dl.appendChild(v);
    dl.appendChild(m);
    
    df.append(dl);
    return df;
};

export default creationEquipe;
