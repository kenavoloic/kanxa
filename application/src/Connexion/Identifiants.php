<?php
namespace Connexion;

class Identifiants {

    // Cette classe sera toujours instanciée en ayant préalablement vérifié l'existence du fichier de configuration
    // if(file_exists($fichier) { .... }
    private $tableau;
    private string $utilisateur;
    private string $mpasse;
    private string $hote;
    private string $dbase;
    private int $port;
    private string $charset;

    private string $dsn;

    public function __construct($fichier){
	$this->tableau = $this->lectureFichierConfiguration($fichier);
	$this->utilisateur = $this->tableau['utilisateur'] ?? '';
	$this->mpasse = $this->tableau['mpasse'] ?? '';
	$this->hote = $this->tableau['hote'] ?? '';
	$this->dbase = $this->tableau['dbase'] ?? '';
	$this->port = $this->tableau['port'] ?? 3306;
	$this->charset = $this->tableau['charset'] ?? '';
	$this->dsn = $this->creationDsn($this->hote, $this->dbase, $this->port);
    }

    private function lectureFichierConfiguration(string $fichier) : array {
	return parse_ini_file($fichier);
    }

    private function creationDsn(string $serveur, string $nomDbase, int $port=3306): string {    
	return "mysql:host=$serveur;port=$port;dbname=$nomDbase;charset=utf8";
    }

    public function getDsn(): string{
	return $this->dsn;
    }

    public function getPDO(): ?\PDO {
	$retour = null;
	try {
	    $retour = new \PDO($this->dsn, $this->utilisateur, $this->mpasse);
	}catch(\PDOException $exception){
	    echo "Connexion impossible";
	    die();
	}
	return $retour;
    }
    
    public function __toString(): string {
	return "Cette classe crée une connexion à la base de données et retourne une instanciation d’un objet PDO.";
    }
    
}
