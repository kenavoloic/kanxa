<form id="poulesSelecteurs" action="/poules/traitement" method="post">
    <div class="itemFormulaire">
	<label for="serie">Série</label>
	<select id="serie" name="poules[serie]">
	    <?= $tableau['series'] ?>
	</select>
    </div>

    <div class="itemFormulaire">
	<label for="genre">Genre</label>
	<select id="genre" name="poules[genre]">
	    <?= $tableau['genres'] ?>
	</select>
	<button type="submit">Envoi</button>
    </div>
</form>
