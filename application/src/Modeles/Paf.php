<?php

namespace Modeles;

class Paf {
    use \Generiques\Outils;

    private $requete = "select jsonSerieGenrePaf(:serie,:genre) as resultat;";
    private $requeteListe = "select jsonSerieGenrePaf(:serie, :genre) as resultat";
    private $requeteTraitement = "call boolRegularisationParticipation(:equipeId);";
    private $requeteNombreEquipe = "select intNombreEquipe();";
    private $requeteNombreEquipePaf = "select intNombreEquipePaf();";
    private $requeteBilan = "select jsonBilanPaf();";


    public function __construct(private \PDO $pdo){
    }

    // retourne 1 en cas de succès, 0 en cas d'échec
    // échec parce que l'id n'existe pas
    public function regularisation(int $id): int {
        $reponse = $this->pdo->prepare($this->requeteTraitement);
        $reponse->bindParam('equipeId', $id, \PDO::PARAM_INT);
        $reponse->execute();
        $retour = $reponse->fetch();
        return $retour[0];
    }

    public function traitement(int $serie, int $genre): array{
        //echo 'traitement => ' . $_SESSION['uri'] . PHP_EOL;
        //echo 'Post => ';
        //var_dump($_POST);
	
        //$serie_ = isset($_POST['paf']['serie']) ? intval($_POST['paf']['serie']) :  0;
        //$genre_ = isset($_POST['paf']['genre']) ? intval($_POST['paf']['genre']) : 0;
        //echo "Modele traitement => ";
        //echo "$serie => $genre";
        $valeurs = [':serie' => $serie, ':genre' => $genre];
        $reponse = $this->pdo->prepare($this->requeteListe);
        $reponse->execute($valeurs);
        $retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC);
        //echo "traitement modele => ";
        //var_dump($retour_);
        $liste = !is_null(array_values($retour_[0])[0]) ? json_decode(array_values($retour_[0])[0], true) : null;
        $retour = ['liste' => $liste, 'series'=> $serie, 'genres' => $genre];

        return $retour;
        //header('Location: /paf');
        //$this->vue->affichage($retour);

	
        //$this->vue->affichageListe($liste);
    }

    public function nombreEquipePaf(): int {
        $reponse = $this->pdo->query($this->requeteNombreEquipePaf);
        $retour = $reponse->fetch(\PDO::FETCH_NUM);
        return $retour[0];
    }

    public function getBilan(): array {
        $reponse = $this->pdo->prepare($this->requeteBilan);
        $reponse->execute();
        $retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC);
        $liste = !is_null(array_values($retour_[0])[0]) ? json_decode(array_values($retour_[0])[0], true) : null;
        //$retour = ['bilan' => $liste];
        //var_dump($liste[0]);
        return $liste[0];
    }
}
