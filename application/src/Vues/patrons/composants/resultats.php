<main id="resultats">
    <form id="formulaire" action="/resultats" method="post">
	<div class="itemFormulaire">
	    <label for="serie">Série</label>
	    <select id="serie" name="resultats[serie]">
		<?= $tableau['series'] ?>
	    </select>
	</div>

	<div class="itemFormulaire">
	    <label for="genre">Genre</label>
	    <select id="genre" name="resultats[genre]">
		<?= $tableau['genres'] ?>
	    </select>

	</div>
    </form>


    <article id="liste">
	<?php if(isset($liste) && !empty($liste)){ echo $liste;}  ?>
    </article>
</main>
