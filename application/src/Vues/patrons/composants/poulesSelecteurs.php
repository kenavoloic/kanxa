<form id="selecteurs" action="/poules/traitement" method="post">
    <fieldset>
	<label for="serie">Série</label>
	<select id="serie" name="poules[serie]">
	    <?= $tableau['series'] ?>
	</select>

	
	<label for="genre">Genre</label>
	<select id="genre" name="poules[genre]">
	    <?= $tableau['genres'] ?>
	</select>
	<button type="submit">Envoi</button>
    </fieldset>
</form>
