<main id="gregorien">
    <form id="formulaire" action="/calendrier" method="post">
	<div class="itemFormulaire">
	    <label for="serie">Série</label>
	    <select id="serie" name="calendrier[serie]">
		<?= $tableau['series'] ?>
	    </select>
	</div>

	<div class="itemFormulaire">
	    <label for="genre">Genre</label>
	    <select id="genre" name="calendrier[genre]">
		<?= $tableau['genres'] ?>
	    </select>

	</div>
    </form>

    <article id="liste">
    </article>

