<main id="login">
    <form action="/login/connexion" method="post">
	<legend><span>Login</span></legend>
	<fieldset>
	    <label for="utilisateur">Utilisateur</label>
	    <input type="text" id="utilisateur" name="administrateur[utilisateur]" pattern="[0-9a-zA-ZŽžÀ-ÿ\s'-]{1,}"  placeholder="Utilisateur" minlength="1" maxlength="255" value="" required>			
	</fieldset>
	<fieldset>
	    <label for="courriel">Courriel</label>
	    <input type="text" id="courriel" name="administrateur[courriel]" pattern="[^@\s]+@[^@\s]+\.[^@\s]+" placeholder="Courriel" value="" required>			
	</fieldset>
	<fieldset>
	    <label for="mpasse">Mot de passe</label>
	    <input type="password" id="mpasse" name="administrateur[mpasse]" pattern="[0-9a-zA-ZŽžÀ-ÿ\s'-]{1,}" placeholder="Mot de passe" minlength="1" maxlength="255" value="" required>			
	</fieldset>
	<fieldset id="boutons">
	    <button type="submit">Connexion</button> <button type="reset">Réinitialiser</button>
	</fieldset>
    </form>
</main>
