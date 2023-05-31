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
	<dl class="equipe" id="pouleId1">
	    <dt>311</dt>
	    <dd class="nom1">Nom1</dd><dd class="prenom1 secondaire">Prénom1</dd>
	    <dd class="nom2">Nom2</dd><dd class="prenom2 secondaire">Prénom2</dd>
	</dl>

	<dl class="equipe" id="pouleId2">
	    <dt>312</dt>
	    <dd class="nom1">Nom1</dd><dd class="prenom1 secondaire">Prénom1</dd>
	    <dd class="nom2">Nom2</dd><dd class="prenom2 secondaire">Prénom2</dd>
	</dl>

	<dl class="equipe" id="pouleId3">
	    <dt>313</dt>
	    <dd class="nom1">Nom1</dd><dd class="prenom1 secondaire">Prénom1</dd>
	    <dd class="nom2">Nom2</dd><dd class="prenom2 secondaire">Prénom2</dd>
	</dl>

	<dl class="equipe" id="pouleId4">
	    <dt>314</dt>
	    <dd class="nom1">Nom1</dd><dd class="prenom1 secondaire">Prénom1</dd>
	    <dd class="nom2">Nom2</dd><dd class="prenom2 secondaire">Prénom2</dd>
	</dl>
    </article>
    
    <article id="tableau">
	<table>
	    <thead>
		<tr>
		    <th>Équipe</th><th>J</th><th>V</th><th>D</th><th>P</th><th>Pts</th>
		</tr>
	    </thead>
	    <tbody>
	    </tbody>
	    <tr><td>313</td><td>3</td><td>0</td><td>0</td><td>0</td><td>9</td></tr>
	    <tr><td>314</td><td>3</td><td>2</td><td>1</td><td>0</td><td>7</td></tr>
	    <tr><td>312</td><td>3</td><td>1</td><td>2</td><td>0</td><td>5</td></tr>
	    <tr><td>311</td><td>3</td><td>0</td><td>3</td><td>0</td><td>3</td></tr>
	</table>
    </article>

    </article>
</main>
