<main id="frais">
    <form id="formulaire" action="/paf/traitement" method="post">
	<div class="itemFormulaire">
	    <label for="serie">Série</label>
	    <select id="serie" name="paf[serie]">
		<?= $tableau['series'] ?>
	    </select>
	</div>

	<div class="itemformulaire">
	    
	    <label for="genre">Genre</label>
	    <select id="genre" name="paf[genre]">
		<?= $tableau['genres'] ?>
	    </select>
	    <button type="submit">Envoi</button>
	</div>
    </form>

</main>
