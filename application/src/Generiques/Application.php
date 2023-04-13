<?php
namespace Generiques;

//use \Controleurs\Accueil;

class Application implements Cancha {

    use Outils;
    //use \Outils\Boot;
    //use \Connexion\Identifiants;
    //use \PDO;

    //use \PDO;
    
    //PDO $pdo;

    private $controleur;
    private $methode;
    private $parametres;
    
    private \Connexion\Identifiants $connexion;
    private \PDO $pdo;
    private $listeBlanche;

    public function __construct(){
	$this->connexion = new \Connexion\Identifiants(APPLICATION  . 'configuration' . DIRECTORY_SEPARATOR . 'identifiants.ini');
	$this->pdo = $this->connexion->getPDO();
	$this->listeBlanche = Cancha::listeBlanche;
	$retour = $this->getControleurMethodeParametres();
	$this->controleur = $retour[0];
	$this->methode = $retour[1];
	$this->parametres = $retour[2];

	$nomClasse = '\\Controleurs\\' . ucfirst($this->controleur);
	$nouvelleInstance = new $nomClasse($this->pdo, $this->methode, $this->parametres);
	//$nouvelleInstance->index();
    }

    private function getControleurMethodeParametres(): array{
	$uri = filter_var($_SERVER["REQUEST_URI"], FILTER_SANITIZE_URL);
	$index = $_SERVER['SCRIPT_NAME'];
	$requete = explode('/', strtolower($uri));
	$requete = array_diff($requete, array('', $index));
	$requete = array_values($requete);

	$controleur = isset($requete[0]) ? $requete[0] : 'accueil';
	$methode = isset($requete[1]) ? $requete[1] : 'index';
	unset($requete[0], $requete[1]);
	$parametres = (count($requete) === 0) ? [] : array_values($requete);

	if($controleur !== 'accueil'){
	    $controleur = array_key_exists($controleur, $this->listeBlanche) ? $controleur : 'accueil';
	    $methode = method_exists(ucfirst($controleur), $methode) ? $methode : 'index';
	}

	$_SESSION['controleur'] = $controleur;
	$_SESSION['methode'] = $methode;
	$_SESSION['parametres'] = $parametres;

	return array($controleur, $methode,$parametres);
	
    }
    
    
    public function __toString(): string {
	return "Kanxa";
    }
    
}
