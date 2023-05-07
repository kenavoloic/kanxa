<fieldset>
    <legend>Avant</legend>
    <label htmlFor="nom1">Nom</label>
    <input type="text" id="nom1" name="equipe[nom1]" placeholder="Nom"  pattern="[a-zA-ZŽžÀ-ÿ\s'-]{1,}" minlength="1" maxlength="255" required/>
</fieldset>

<fieldset>
    <label htmlFor="prenom1">Prénom</label>
    <input type="text" id="prenom1" name="equipe[prenom1]" placeholder="Prénom" pattern="[a-zA-ZŽžÀ-ÿ\s'-]{1,}"  minlength="1" maxlength="255" required/>
</fieldset>

<fieldset>
    <label htmlFor="courriel1">Courriel</label>
    <input type="text" id="courriel1" name="equipe[courriel1]" placeholder="Courriel"  pattern="[^@\s]+@[^@\s]+\.[^@\s]+" required />
</fieldset>

<fieldset>
    <label htmlFor="telephone1">Téléphone</label>
    <input type="text" id="telephone1" name="equipe[telephone1]"  placeholder="Téléphone" pattern="[0-9-\s\.:/]{10,15}"  />
</fieldset>

<fieldset>
    <label htmlFor="licence1">Licence</label>
    <input type="text" id="licence1" name="equipe[licence1]" placeholder="Licence" pattern="[A-Z0-9]{8,10}" />
</fieldset>
