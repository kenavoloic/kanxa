<main id="inscription">
    <form class="paire" id="formulaire" action="/inscription/ajout" method="post">

	<fieldset>
	    <legend>Compétition</legend>

	    <div class="itemFormulaire">
		<label for="serie">Série</label>
		<select id="serie" name="equipe[serie]">
		    <?= $tableau['series'] ?>
		</select>
	    </div>

	    <div class="itemFormulaire">
		<label for="genre">Genre</label>
		<select id="genre" name="equipe[genre]">
		    <?= $tableau['genres'] ?>
		</select>
	    </div>

	    <div id="compteur" class="itemFormulaire">
		<label id="nombre" for="nombreEquipes">Nombre</label>
		<input type="text" title="Nombre d’équipes inscrites dans cette série" id="nombreEquipes"   disabled />
	    </div>
	    
	</fieldset>

	<fieldset>
	    <legend>Souhaits</legend>
	    <div class="groupeRadio">
		<label for="indifferent" data-initial="Indifférent" data-remplacement="Ind">Indifférent</label>
		<input type="radio"  id="indifferent" name="equipe[souhait]" value="1" pattern="[\d]" checked />
	    </div>

	    <div class="groupeRadio">
		<label for="semaine" data-initial="En semaine" data-remplacement="Sem">En semaine</label>
		<input type="radio"  id="semaine" name="equipe[souhait]" value="2" pattern="[\d]"/>
	    </div>

	    <div class="groupeRadio">
		<label for="weekend" data-initial="Le week-end" data-remplacement="WE">Week-end</label>
		<input type="radio"  id="weekend" name="equipe[souhait]" value="3" pattern="[\d]" />		
	    </div>
	</fieldset>

  	<fieldset>
	    <legend>Avant</legend>
	    <label for="nom1">Nom</label>
	    <input type="text" id="nom1" name="equipe[nom1]" title="Requis" placeholder="Nom"  pattern="[a-zA-ZŽžÀ-ÿ\s'-]{1,}" minlength="1" maxlength="255" required/>
	</fieldset>

	<fieldset>
	    <label for="prenom1">Prénom</label>
	    <input type="text" id="prenom1" name="equipe[prenom1]" title="Requis" placeholder="Prénom" pattern="[a-zA-ZŽžÀ-ÿ\s'-]{2,}"  minlength="1" maxlength="255" required/>
	</fieldset>

	<fieldset>
	    <label for="courriel1">Courriel</label>
	    <input type="text" id="courriel1" name="equipe[courriel1]" title="Requis" placeholder="Courriel"  pattern="[^@\s]+@[^@\s]+\.[^@\s]+" required />
	</fieldset>

	<fieldset>
	    <label for="telephone1">Mobile</label>
	    <input type="text" id="telephone1" name="equipe[telephone1]"  title="Optionnel" placeholder="Mobile" pattern="[0-9-\s\.:/]{10,15}"  />
	</fieldset>

	<fieldset>
	    <label for="licence1">Licence</label>
	    <input type="text" id="licence1" name="equipe[licence1]" title="Optionnel" placeholder="Licence" pattern="[A-Z0-9]{8,10}" />
	</fieldset>

	<fieldset>
	    <legend>Arrière</legend>
	    <label for="nom2">Nom</label>
	    <input type="text" id="nom2" name="equipe[nom2]" title="Requis" placeholder="Nom"  pattern="[a-zA-ZŽžÀ-ÿ\s'-]{1,}" minlength="1" maxlength="255" required />
	</fieldset>

	<fieldset>
	    <label for="prenom2">Prénom</label>
	    <input type="text" id="prenom2" name="equipe[prenom2]" title="Requis" placeholder="Prénom"  pattern="[a-zA-ZŽžÀ-ÿ\s'-]{2,}" minlength="1" maxlength="255" required />
	</fieldset>

	<fieldset>
	    <label for="courriel2">Courriel</label>
	    <input type="text" id="courriel2" name="equipe[courriel2]" title="Requis" placeholder="Courriel"  pattern="[^@\s]+@[^@\s]+\.[^@\s]+" required />
	</fieldset>

	<fieldset>
	    <label for="telephone2">Mobile</label>
	    <input type="text" id="telephone2" name="equipe[telephone2]"  title="Optionnel" placeholder="Mobile" pattern="[0-9-\s\.:/]{10,15}"  />
	</fieldset>

	<fieldset>
	    <label for="licence2">Licence</label>
	    <input type="text" id="licence2" name="equipe[licence2]" title="Optionnel" placeholder="Licence" pattern="[A-Z0-9]{8,10}" />
	</fieldset>

	<fieldset>
	    <button type="submit">Enregistrer</button> 		<button type="reset">Réinitialiser</button>
	</fieldset>
    </form>
</main>
