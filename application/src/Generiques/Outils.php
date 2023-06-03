<?php
namespace Generiques;

trait Outils {


    public function administrateur_p(): bool {
	$retour = false;

	if( isset($_SESSION['officiel']) && ($_SESSION['officiel'] === true)){
	    $retour = true;
	}
	return  $retour;
    }
    
    public function redirection(string $lien=''){
	header('Location: /' . $lien);
	exit(); // toujours nécessaire ?
    }

    public function ucfirst_utf8(string $chaine): string {
	return mb_convert_case($chaine, MB_CASE_TITLE, "UTF-8");
    }
    // Conversion date
    // PHP : 1er janvier 2023 = 0 2023
    // MYSQL : 1er janvier 2023 = 1 2023

    //php => mysql : +1
    //mysql => php : -1

    public function dayOfYearPhpMysql(array $jourAnnee): array{
	$jour = $jourAnnee['jour'] + 1;
	$annee = $jourAnnee['annee'];
	return ['jour' => $jour, 'annee', $annee];
    }

    public function dayOfYearMysqlPhp(array $jourAnnee): \JourCalendaire {
	return new \JourCalendaire($jourAnnee['annee'], '', '', $jourAnnee['jour']);
    }

    // Validations
    public function remplaceApostropheDroiteParApostropheTypograpique(string $envoi): string {
	return str_replace("'", "\u{2019}", $envoi);
    }

    public function queDesChiffres(string $envoi): int {
	$retour = preg_replace("/[^\d]/", "", $envoi);
	//$retour = preg_filter("/[^\d/]", "", $envoi);
	//return intval($retour) ? intval($retour) : 0; intval retournera soit 0 en cas d'échec soit la valeur entière
	return intval($retour);
    }

    public function queDesLettres(string $envoi): string {
	$retour = preg_replace("/[^a-zA-ZŽžÀ-ÿ'-]+$/", "", $envoi);
	return $retour;
    }

    public function nettoyageSimple(string $envoi): string {
	$retour = $this->remplaceApostropheDroiteParApostropheTypograpique(trim($envoi));
	return htmlspecialchars($retour);
    }

    // Prédicats
    public function courriel_p(string $envoi): bool{
	return preg_match("/^[^@\s]+@[^@\s]+\.[^@\s]+$/", $envoi);
    }

    public function nom_p(string $envoi): bool {
	return preg_match("/^[a-zA-ZŽžÀ-ÿ\s'-]{1,255}/", $envoi);
    }

    public function prenom_p(string $envoi): bool {
	return preg_match("/^[a-zA-ZŽžÀ-ÿ\s'-]{2,}/", $envoi);
    }

    public function pseudo_p(string $envoi): bool {
	return preg_match("/^[a-zA-Z\d]+$", $envoi);
    }

    public function chiffre_p(string $envoi): bool {
	return preg_match("/^[\d]+$/", $envoi);
    }

    // Seuls caractères acceptés en plus de l'espace
    public function telephone_p(string $envoi): bool {
	return preg_match("/^[\d\s.:\/-]+$", $envoi);
    }

    // 1, 1a, 1b, 2, 2a, 2b, 3 ...
    public function serie_p(string $envoi): bool {
	return preg_match("/^[1-9][ab]$/", $envoi);
    }

    // homme, femme, mixte
    public function genre_p(string $envoi): bool {
	return preg_match("/^[1-3]$/", $envoi);
    }

    // trois vœux uniquement
    public function souhait_p(string $envoi): bool {
	return preg_match("/^[1-3]$/", $envoi);
    }

    public function licence_p(string $envoi): bool {
	return preg_match("/^[FH][0-9]{8}$/", strtoupper($envoi));
    }
}
