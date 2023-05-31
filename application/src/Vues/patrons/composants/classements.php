<main id="rankings">
    <form id="formulaire" action="/classements" method="post">
	<div class="itemFormulaire">
	    <label for="serie">Série</label>
	    <select id="serie" name="classements[serie]">
		<?= $tableau['series'] ?>
	    </select>
	</div>

	<div class="itemFormulaire">
	    <label for="genre">Genre</label>
	    <select id="genre" name="classements[genre]">
		<?= $tableau['genres'] ?>
	    </select>

	</div>

	<div class="itemFormulaire">
	    <label for="poule">Poule</label>
	    <select id="poule" name="<?= $tableau['controleur']?>[poule]">
		<option value="0" selected disabled>Poule</option>
	    </select>
	</div>
	
    </form>

    <article id="liste">
    </article>
</main>
