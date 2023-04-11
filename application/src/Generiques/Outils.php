<?php
namespace Generiques;

trait Outils {
    public function redirection(string $lien='index'){
	header('location: ' . URL . '/' . $lien);
    }

    public function ucfirst_utf8(string $chaine): string {
	return mb_convert_case($chaine, MB_CASE_TITLE, "UTF-8");
    }

    //

    // Validations
    public function remplaceApostropheDroiteParApostropheTypograpique(string $envoi): string {
	return str_replace("'", "\u{2019}", $envoi);
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
