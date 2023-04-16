<main id="frais">
    <form action="/paf/traitement" method="post">
	<fieldset>
	    <label for="serie">Série</label>
	    <select id="serie" name="paf[serie]">
		<option value="1">Première</option>
		<option value="2">Deuxième</option>
		<option value="3">Troisième</option>
	    </select>

	    <label for="genre">Genre</label>
	    <select id="genre" name="paf[genre]">
		<option value="1">Homme</option>
		<option value="2">Femme</option>
		<option value="3" disabled>Mixte</option>
	    </select>
	    <button type="submit">Envoi</button>
	</fieldset>
    </form>

    <article id="liste">
    </article>
</main>
