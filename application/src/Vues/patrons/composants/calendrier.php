	<main id="calendrier">
	    <form id="datesGenerales" action="" method="post">

		<input type="hidden" id="affichageErreurs" value="" />

		<fieldset>
		    <legend>Ouverture des inscriptions</legend>

		    <select id="joursOI" name="dates[ouvertureInscriptions][jour]" minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getJours(); ?>
		    </select>

		    <select id="moisOI" name="dates[ouvertureInscriptions][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getMois(); ?>
		    </select>

		    <select id="anneeOI" name="dates[ouvertureInscriptions][annee]" minlength="4" maxlength="4" pattern="[\d]{4}" required>
			<?= getAnnees(); ?>
		    </select>
		    <span id="OI"></span>
		</fieldset>

		<fieldset>
		    <legend>Clôture des inscriptions</legend>

		    <select id="joursCI" name="dates[clotureInscriptions][jour]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getJours(); ?>
		    </select>

		    <select id="moisCI" name="dates[clotureInscriptions][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getMois(); ?>
		    </select>

		    <select id="anneeCI" name="dates[clotureInscriptions][annee]"  minlength="4" maxlength="4" pattern="[\d]{4}" required>
			<?= getAnnees(); ?>
		    </select>
		    <span id="CI"></span>
		</fieldset>

		<fieldset>
		    <legend>Constitution des poules</legend>

		    <select id="joursCP" name="dates[constitutionPoules][jour]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getJours(); ?>
		    </select>

		    <select id="moisCP" name="dates[constitutionPoules][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getMois(); ?>
		    </select>

		    <select id="anneeCP" name="dates[constitutionPoules][annee]" minlength="4" maxlength="4" pattern="[\d]{4}" required>
			<?= getAnnees(); ?>
		    </select>
		    <span id="CP"></span>
		</fieldset>

		<fieldset>
		    <legend>Envoi des listes de poules</legend>

		    <select id="joursELP" name="dates[envoiListePoules][jour]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getJours(); ?>
		    </select>

		    <select id="moisELP" name="dates[envoiListePoules][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getMois(); ?>
		    </select>

		    <select id="anneeELP" name="dates[envoiListePoules][annee]" minlength="4" maxlength="4" pattern="[\d]{4}" required>
			<?= getAnnees(); ?>
		    </select>
		    <span id="ELP"></span>
		</fieldset>
		
		<fieldset>
		    <legend>Début du tournoi</legend>

		    <select id="joursDT" name="dates[debutTournoi][jour]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getJours(); ?>
		    </select>

		    <select id="moisDT" name="dates[debutTournoi][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getMois(); ?>
		    </select>

		    <select id="anneeDT" name="dates[debutTournoi][annee]" minlength="4" maxlength="4" pattern="[\d]{4}" required>
			<?= getAnnees(); ?>
		    </select>
		    <span id="DT"></span>
		</fieldset>

		<fieldset>
		    <legend>Quarts de finales</legend>

		    <select id="joursQ" name="dates[quarts][jour]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getJours(); ?>
		    </select>

		    <select id="moisQ" name="dates[quarts][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getMois(); ?>
		    </select>

		    <select id="anneeQ" name="dates[quarts][annee]" minlength="4" maxlength="4" pattern="[\d]{4}" required>
			<?= getAnnees(); ?>
		    </select>
		    <span id="Q"></span>
		</fieldset>

		<fieldset>
		    <legend>Demi-finales</legend>

		    <select id="joursD" name="dates[demi][jour]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getJours(); ?>
		    </select>

		    <select id="moisD" name="dates[demi][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getMois(); ?>
		    </select>

		    <select id="anneeD" name="dates[demi][annee]" minlength="4" maxlength="4" pattern="[\d]{4}" required>
			<?= getAnnees(); ?>
		    </select>
		    <span id="D"></span>
		</fieldset>


		<fieldset>
		    <legend>Finales</legend>

		    <select id="joursF" name="dates[finales][jour]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getJours(); ?>
		    </select>

		    <select id="moisF" name="dates[finales][mois]"  minlength="1" maxlength="2" pattern="[\d]{1,2}" required>
			<?= getMois(); ?>
		    </select>

		    <select id="anneeF" name="dates[finales][annee]" minlength="4" maxlength="4" pattern="[\d]{4}" required>
			<?= getAnnees(); ?>
		    </select>
		    <span id="F"></span>
		</fieldset>

		<button type="submit">Enregistrement</button>
		<button type="reset">Réinitialiser</button>
	    </form>
	</main>
