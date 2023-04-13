<main id="login">
<form action="" method="post" enctype="multipart/form-data">
    <fieldset>
	<label for="utilisateur">Utilisateur</label>
	<input type="text" id="utilisateur" name="utilisateur" pattern="[0-9a-zA-ZŽžÀ-ÿ\s'-]{1,}"  minlength="1" maxlength="255" required>			
    </fieldset>
    <fieldset>
	<label for="courriel">Courriel</label>
	<input type="text" id="courriel" name="courriel" pattern="[^@\s]+@[^@\s]+\.[^@\s]+">			
    </fieldset>
    <fieldset>
	<label for="mpasse">Mot de passe</label>
	<input type="password" id="mpasse" name="mpasse" pattern="[0-9a-zA-ZŽžÀ-ÿ\s'-]{1,}" minlength="1" maxlength="255" required>			
    </fieldset>
    <input type="hidden" name="token" value="barbapapa">
    <div>
	<button type="submit">Envoi</button> <button type="reset">Réinitialiser</button>
    </div>

</form>
</main>
