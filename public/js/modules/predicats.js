const nom_p = envoi => /^[a-zA-ZŽžÀ-ÿ\s'-]{1,}/.test(envoi);
const prenom_p = envoi => /^[a-zA-ZŽžÀ-ÿ\s'-]{1,}/.test(envoi); // lettres + espace et apostrophe droite
const courriel_p = envoi => /^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(envoi); // tout sauf @ et espace
const telephone_p = envoi => /^[\d\s.:\/-]+$/.test(envoi); // chiffres et . : / et -
const nombre_p = envoi => /^[\d]+$/.test(envoi);
const serie_p = envoi => /^[1-9][ab]?$/.test(envoi); // 1, 1a, 1b, 2, 2a, 2b, 3 ...
const genre_p = envoi => /^[123]$/.test(envoi);
const souhait_p = envoi => /^[1-3]$/.test(envoi); // Trois voeux uniquement

export {nom_p, prenom_p, courriel_p, telephone_p, nombre_p, serie_p, genre_p, souhait_p};
