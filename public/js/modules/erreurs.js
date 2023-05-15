const erreurs = envoi => {
    const retour = 0;
    const liste = [
	[0, "Ces données ne sont pas conformes au format."],
	[1, "Une valeur est nécessaire."],
	[2, "Ce champs ne peut être vide."],
	[3, "Dans quelle série ?"],
	[4, "Quel tournoi ? Masculin, féminin ou mixte ?"],
	[5, "Un pelotari sans nom ? Une pelotari sans nom ?"],
	[6, "Pas de prénom ?"],
	[7, "Sans courriel, pas de calendrier des parties !"],
	[8, "Sans numéro de mobile, comment vous joindre rapidement ?"]
    ];
    const messages = new Map(liste);
    return messages.has(envoi) ? messages.get(envoi) : messages.get(retour);
}

export default erreurs;
