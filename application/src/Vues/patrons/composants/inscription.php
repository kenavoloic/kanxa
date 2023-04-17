<main id="inscription">
    <form class="paire" action="/inscription/ajout" method="post">

	<fieldset>
	    <legend>Compétition</legend>
	    <select id="serie" name="serie">
		<option value="1">Première</option>
		<option value="2">Deuxième</option>
		<option value="3">Troisième</option>
	    </select>

	    <select id="genre" name="genre">
		<option value="1">Homme</option>
		<option value="2">Femme</option>
		<option value="3" disabled>Mixte</option>
	    </select>

	    <div class="itemFormulaire">
		<label id="nombre" for="nombreEquipes">Nombre d’inscriptions</label>
		<input type="text" id="nombreEquipes" value="1" pattern="[\d]+" disabled />
	    </div>
	    
	</fieldset>

	<fieldset>
	    <legend>Souhaits</legend>
	    <div class="groupeRadio">
		<input type="radio" id="indifferent" name="souhait" value="1" pattern="[\d]" checked />
		<label for="indifferent">Indifférent</label>
	    </div>

	    <div class="grouperadio">
		<input type="radio" id="semaine" name="souhait" value="2" pattern="[\d]"/>
		<label for="semaine">En semaine uniquement</label>
	    </div>

	    <div class="groupeRadio">
		<input type="radio" id="weekend" name="souhait" value="3" pattern="[\d]" />		
		<label for="weekend">Week-end uniquement</label>
	    </div>
	</fieldset>

	<fieldset>
	    <legend>Avant</legend>
	    <label htmlFor="nom1">Nom</label>
	    <input type="text" id="nom1" name="nom1" placeholder="Nom"  pattern="[a-zA-ZŽžÀ-ÿ\s'-]{1,}" minlength="1" maxlength="255" required/>
	</fieldset>

	<fieldset>
	    <label htmlFor="prenom1">Prénom</label>
	    <input type="text" id="prenom1" name="prenom1" placeholder="Prénom" pattern="[a-zA-ZŽžÀ-ÿ\s'-]{1,}"  minlength="1" maxlength="255" required/>
	</fieldset>

	<fieldset>
	    <label htmlFor="courriel1">Courriel</label>
	    <input type="text" id="courriel1" name="courriel1" placeholder="Courriel"  pattern="[^@\s]+@[^@\s]+\.[^@\s]+" required />
	</fieldset>

	<fieldset>
	    <label htmlFor="telephone1">Téléphone</label>
	    <input type="text" id="telephone1" name="telephone1"  placeholder="Téléphone" pattern="[0-9-\s\.:/]{10,15}"  />
	</fieldset>

	<fieldset>
	    <label htmlFor="licence1">Licence</label>
	    <input type="text" id="licence1" name="licence1" placeholder="Licence" pattern="[A-Z0-9]{8,10}" />
	</fieldset>

	<fieldset>
	    <legend>Arrière</legend>
	    <label htmlFor="nom2">Nom</label>
	    <input type="text" id="nom2" name="nom2" placeholder="Nom"  pattern="[a-zA-ZŽžÀ-ÿ\s'-]{1,}" minlength="1" maxlength="255" required />
	</fieldset>

	<fieldset>
	    <label htmlFor="prenom2">Prénom</label>
	    <input type="text" id="prenom2" name="prenom2" placeholder="Prénom"  pattern="[a-zA-ZŽžÀ-ÿ\s'-]{1,}" minlength="1" maxlength="255" required />
	</fieldset>

	<fieldset>
	    <label htmlFor="courriel2">Courriel</label>
	    <input type="text" id="courriel2" name="courriel2" placeholder="Courriel"  pattern="[^@\s]+@[^@\s]+\.[^@\s]+" required />
	</fieldset>

	<fieldset>
	    <label htmlFor="telephone2">Téléphone</label>
	    <input type="phone" id="telephone2" name="telephone2"  placeholder="Téléphone" pattern="[0-9-\s\.:/]{10,15}"  />
	</fieldset>

	<fieldset>
	    <label htmlFor="licence2">Licence</label>
	    <input type="text" id="licence2" name="licence2" placeholder="Licence" pattern="[A-Z0-9]{8,10}" />
	</fieldset>

	<input type="hidden" name="token" />

	<fieldset>
	    <button type="submit">Enregistrer</button> 		<button type="reset">Réinitialiser</button>
	</fieldset>
    </form>
</main>
