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

    // Validations
    public function remplaceApostropheDroiteParApostropheTypograpique(string $envoi): string {
	return str_replace("'", "\u{2019}", $envoi);
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
	return preg_match("/^[a-zA-ZŽžÀ-ÿ\s'-]+$/", $envoi);
    }

    public function prenom_p(string $envoi): bool {
	return preg_match("/^[a-zA-ZŽžÀ-ÿ\s'-]+$/", $envoi);
    }

    public function pseudo_p(string $envoi): bool {
	return preg_match("/^[a-zA-Z\d]+$", $envoi);
    }

    public function chiffre_p(string $envoi): bool {
	return preg_match("/^[\d]+$/", $envoi);
    }
    
}
