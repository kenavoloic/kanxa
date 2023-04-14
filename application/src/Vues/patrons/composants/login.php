<main id="login">
    <form action="/login" method="post" enctype="multipart/form-data">
	<legend>Login</legend>
	<fieldset>
	    <label for="utilisateur">Utilisateur</label>
	    <input type="text" id="utilisateur" name="administrateur[utilisateur]" pattern="[0-9a-zA-ZŽžÀ-ÿ\s'-]{1,}"  minlength="1" maxlength="255" required>			
	</fieldset>
	<fieldset>
	    <label for="courriel">Courriel</label>
	    <input type="text" id="courriel" name="administrateur[courriel]" pattern="[^@\s]+@[^@\s]+\.[^@\s]+">			
	</fieldset>
	<fieldset>
	    <label for="mpasse">Mot de passe</label>
	    <input type="password" id="mpasse" name="administrateur[mpasse]" pattern="[0-9a-zA-ZŽžÀ-ÿ\s'-]{1,}" minlength="1" maxlength="255" required>			
	</fieldset>
	<fieldset id="boutons">
	    <button type="submit">Envoi</button> <button type="reset">Réinitialiser</button>
	</fieldset>
    </form>
</main>
