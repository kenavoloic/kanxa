<main id="gregorien">
    <form id="formulaire" action="/calendrier" method="post">
	<div class="itemFormulaire">
	    <label for="serie">Série</label>
	    <select id="serie" name="calendrier[serie]">
		<?= $tableau['series'] ?>
	    </select>
	</div>

	<div class="itemFormulaire">
	    <label for="genre">Genre</label>
	    <select id="genre" name="calendrier[genre]">
		<?= $tableau['genres'] ?>
	    </select>

	</div>
    </form>

    <article id="liste">
	<dl data-partieId="36" data-phaseId="5" data-equipe1="H212" data-equipe2="H214" data-serie="2" data-genre="1" data-jour="25 mars 2023" data-heure="10h00"></dl>
	<dl data-partieId="134" data-phaseId="10" data-equipe1="F222" data-equipe2="F223" data-serie="2" data-genre="2" data-jour="25 mars 2023" data-heure="11h00"></dl>
	<dl data-partieId="174" data-phaseId="19" data-equipe1="F341" data-equipe2="F342" data-serie="3" data-genre="2" data-jour="25 mars 2023" data-heure="12h00"></dl>
	<dl data-partieId="128" data-phaseId="4" data-equipe1="F212" data-equipe2="F213" data-serie="2" data-genre="2" data-jour="25 mars 2023" data-heure="13h00"></dl>
	<dl data-partieId="15" data-phaseId="15" data-equipe1="H131" data-equipe2="H134" data-serie="1" data-genre="1" data-jour="25 mars 2023" data-heure="14h00"></dl>
	<dl data-partieId="168" data-phaseId="13" data-equipe1="F331" data-equipe2="F332" data-serie="3" data-genre="2" data-jour="25 mars 2023" data-heure="15h00"></dl>
	<dl data-partieId="98" data-phaseId="5" data-equipe1="F112" data-equipe2="F114" data-serie="1" data-genre="2" data-jour="25 mars 2023" data-heure="16h00"></dl>
	<dl data-partieId="116" data-phaseId="23" data-equipe1="F142" data-equipe2="F144" data-serie="1" data-genre="2" data-jour="25 mars 2023" data-heure="17h00"></dl>
	<dl data-partieId="43" data-phaseId="12" data-equipe1="H223" data-equipe2="H224" data-serie="2" data-genre="1" data-jour="26 mars 2023" data-heure="10h00"></dl>
	<dl data-partieId="46" data-phaseId="15" data-equipe1="H231" data-equipe2="H234" data-serie="2" data-genre="1" data-jour="26 mars 2023" data-heure="11h00"></dl>
    </article>

</main>
