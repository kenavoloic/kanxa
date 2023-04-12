<?php
namespace Vues;

class Accueil {

    use OutilsVues;

    public function __construct(private string $titre=""){
	$this->affichage($this->titre);
    }

    public function affichage(string $titre): void{
	echo $this->getComposant('entete');
	
	echo "<h1>".$titre."</h1>";

	echo "<h2>"."Odio eu feugiat"."</h2>";
	

	echo "<p>Id consectetur purus ut faucibus pulvinar elementum integer enim neque. Odio eu feugiat pretium, nibh ipsum consequat nisl, vel pretium. Praesent tristique magna sit amet purus gravida quis blandit turpis. Quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci? Sit amet commodo nulla facilisi nullam vehicula ipsum a arcu! Sapien pellentesque habitant morbi tristique senectus et netus et malesuada. Ornare suspendisse sed nisi lacus, sed viverra tellus in hac. A, condimentum vitae sapien pellentesque habitant morbi tristique senectus et? Ultrices sagittis orci, a scelerisque purus semper eget duis at? Cras fermentum, odio eu feugiat pretium, nibh ipsum consequat nisl.</p>";	
    }

    public function __toString(){
    }
    
}
