<main id="generales">
    <form id="datesGenerales" action="" method="post">

	<fieldset>
	    <legend>Ouverture des inscriptions</legend>

	    <select id="joursOI" name="dates[ouvertureInscriptions][jour]" minlength="1" maxlength="2" pattern="[\d]{1,2}"  required>
		<?= $this->getJours($tableau["oi"][0]); ?>
	    </select>

	    <select id="moisOI" name="dates[ouvertureInscriptions][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
		<?= $this->getMois($tableau["oi"][1]); ?>
	    </select>

	    <select id="anneeOI" name="dates[ouvertureInscriptions][annee]" minlength="4" maxlength="4" pattern="[\d]{4}" required>
		<?= $this->getAnnees($tableau["oi"][2]); ?>
	    </select>
	    <span id="OI"></span>
	</fieldset>

	<fieldset>
	    <legend>Clôture des inscriptions</legend>

	    <select id="joursCI" name="dates[clotureInscriptions][jour]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
		<?= $this->getJours($tableau["ci"][0]); ?>
	    </select>

	    <select id="moisCI" name="dates[clotureInscriptions][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
		<?= $this->getMois($tableau["ci"][1]); ?>
	    </select>

	    <select id="anneeCI" name="dates[clotureInscriptions][annee]"  minlength="4" maxlength="4" pattern="[\d]{4}" required>
		<?= $this->getAnnees($tableau["ci"][2]); ?>
	    </select>
	    <span id="CI"></span>
	</fieldset>

	<fieldset>
	    <legend>Constitution des poules</legend>

	    <select id="joursCP" name="dates[constitutionPoules][jour]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
		<?= $this->getJours($tableau["cp"][0]); ?>
	    </select>

	    <select id="moisCP" name="dates[constitutionPoules][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
		<?= $this->getMois($tableau["cp"][1]); ?>
	    </select>

	    <select id="anneeCP" name="dates[constitutionPoules][annee]" minlength="4" maxlength="4" pattern="[\d]{4}" required>
		<?= $this->getAnnees($tableau["cp"][2]); ?>
	    </select>
	    <span id="CP"></span>
	</fieldset>

	<fieldset>
	    <legend>Envoi des listes de poules</legend>

	    <select id="joursELP" name="dates[envoiListePoules][jour]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
		<?= $this->getJours($tableau["elp"][0]); ?>
	    </select>

	    <select id="moisELP" name="dates[envoiListePoules][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
		<?= $this->getMois($tableau["elp"][1]); ?>
	    </select>

	    <select id="anneeELP" name="dates[envoiListePoules][annee]" minlength="4" maxlength="4" pattern="[\d]{4}" required>
		<?= $this->getAnnees($tableau["elp"][2]); ?>
	    </select>
	    <span id="ELP"></span>
	</fieldset>
	
	<fieldset>
	    <legend>Début du tournoi</legend>

	    <select id="joursDT" name="dates[debutTournoi][jour]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
		<?= $this->getJours($tableau["dt"][0]); ?>
	    </select>

	    <select id="moisDT" name="dates[debutTournoi][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
		<?= $this->getMois($tableau["dt"][1]); ?>
	    </select>

	    <select id="anneeDT" name="dates[debutTournoi][annee]" minlength="4" maxlength="4" pattern="[\d]{4}" required>
		<?= $this->getAnnees($tableau["dt"][2]); ?>
	    </select>
	    <span id="DT"></span>
	</fieldset>

	<fieldset>
	    <legend>Quarts de finales</legend>

	    <select id="joursQ" name="dates[quarts][jour]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
		<?= $this->getJours($tableau["quarts"][0]); ?>
	    </select>

	    <select id="moisQ" name="dates[quarts][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
		<?= $this->getMois($tableau["quarts"][1]); ?>
	    </select>

	    <select id="anneeQ" name="dates[quarts][annee]" minlength="4" maxlength="4" pattern="[\d]{4}" required>
		<?= $this->getAnnees($tableau["quarts"][2]); ?>
	    </select>
	    <span id="Q"></span>
	</fieldset>

	<fieldset>
	    <legend>Demi-finales</legend>

	    <select id="joursD" name="dates[demi][jour]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
		<?= $this->getJours($tableau["demi"][0]); ?>
	    </select>

	    <select id="moisD" name="dates[demi][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
		<?= $this->getMois($tableau["demi"][1]); ?>
	    </select>

	    <select id="anneeD" name="dates[demi][annee]" minlength="4" maxlength="4" pattern="[\d]{4}" required>
		<?= $this->getAnnees($tableau["demi"][2]); ?>
	    </select>
	    <span id="D"></span>
	</fieldset>


	<fieldset>
	    <legend>Finales</legend>

	    <select id="joursF" name="dates[finales][jour]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
		<?= $this->getJours($tableau["finales"][0]); ?>
	    </select>

	    <select id="moisF" name="dates[finales][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
		<?= $this->getMois($tableau["finales"][1]); ?>
	    </select>

	    <select id="anneeF" name="dates[finales][annee]" minlength="4" maxlength="4" pattern="[\d]{4}" required>
		<?= $this->getAnnees($tableau["finales"][2]); ?>
	    </select>
	    <span id="F"></span>
	</fieldset>

	<fieldset>
	<button type="submit">Enregistrement</button>
	<button type="reset">Réinitialiser</button>
	</fieldset>
    </form>
</main>
