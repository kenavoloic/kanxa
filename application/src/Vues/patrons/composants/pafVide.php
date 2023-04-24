<main id="frais">
    <form id="formulaire" action="/paf/traitement" method="post">
	<fieldset>
	    <label for="serie">Série</label>
	    <select id="serie" name="paf[serie]">
		<?= $tableau['series'] ?>
	    </select>

	   
	    <label for="genre">Genre</label>
	    <select id="genre" name="paf[genre]">
		<?= $tableau['genres'] ?>
	    </select>
	    <button type="submit">Envoi</button>
	</fieldset>
    </form>

</main>
