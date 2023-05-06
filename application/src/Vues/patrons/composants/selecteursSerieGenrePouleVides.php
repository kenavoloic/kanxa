<form id="selecteurs" action="<?= $tableau['action'] ?>" method="post">
    <fieldset>
	<label for="serie">Série</label>
	<select id="serie" name="<?= $tableau['controleur']?>[serie]">
	    <?= $tableau['series'] ?>
	</select>

	
	<label for="genre">Genre</label>
	<select id="genre" name="<?= $tableau['controleur']?>[genre]">
	    <?= $tableau['genres'] ?>
	</select>

	<label for="poule">Poule</label>
	<select id="poule" name="<?= $tableau['controleur']?>[poule]">
	</select>
    </fieldset>
</form>
