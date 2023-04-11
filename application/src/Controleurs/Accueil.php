<?php
namespace Controleurs;

class Accueil {

    use \Generiques\Outils;
    
    public function __construct(private \PDO $pdo, private string $methode, private array $parametres, private string $titre="Accueil"){
	//var_dump($this->methode);
	$this->affichage();
    }

    public function affichage(): void{
	echo "<h1>".$this->titre."</h1>";

	echo "<p>Id consectetur purus ut faucibus pulvinar elementum integer enim neque. Odio eu feugiat pretium, nibh ipsum consequat nisl, vel pretium. Praesent tristique magna sit amet purus gravida quis blandit turpis. Quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci? Sit amet commodo nulla facilisi nullam vehicula ipsum a arcu! Sapien pellentesque habitant morbi tristique senectus et netus et malesuada. Ornare suspendisse sed nisi lacus, sed viverra tellus in hac. A, condimentum vitae sapien pellentesque habitant morbi tristique senectus et? Ultrices sagittis orci, a scelerisque purus semper eget duis at? Cras fermentum, odio eu feugiat pretium, nibh ipsum consequat nisl.</p>";	
    }
    
    
}
