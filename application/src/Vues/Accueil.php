<?php
namespace Vues;

class Accueil {

    use OutilsVues;

    public function __construct(private string $titre="K@nx@"){
	$this->affichage($this->titre);
    }

    public function affichage(string $titre): void{
	echo $this->getEntete($titre);
	echo $this->getComposant('headerHaut');
	//echo $this->getComposant('menusUtilisateur');
	echo $this->getComposant('menusAdministrateur');
	echo $this->getComposant('headerBas');
	echo $this->getComposant('basdepage');
    }

    public function __toString(){
	return "Vue en charge de l’affichage de la page d’accueil, page servant également dans les cas où l’URL renseignée n’est pas prise en charge.";
    }
    
}
