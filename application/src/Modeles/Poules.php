<?php

namespace Modeles;

class Poules {

    private $requeteNombreEquipeSerieGenre = "select intNombreEquipeSerieGenre(:serie, :genre);";
    private $requeteNombreEquipeSerieGenreSansPoule = "select intNombreEquipeSerieGenreSansPoule(:serie, :genre);";
    private $requeteNombreEquipeSerieGenreAvecPoule = "select intNombreEquipeSerieGenreAvecPoule(:serie, :genre);";

    private $requeteJsonEquipeSerieGenreSansPoule = "select jsonEquipeSerieGenreSansPoule(:serie, :genre);";
    private $requeteJsonEquipeSerieGenreAvecPoule = "select jsonEquipeSerieGenreAvecPoule(:serie, :genre);";
    private $requeteJsonEquipeIdSouhait = "select jsonEquipeIdSouhait(:serie, :genre);";

    //private $requeteConstitutionPoules = "call constitutionPoules(:chaine);";
    private $requeteConstitutionPoules = "call constitutionPoulesAttributionPouleId(:chaine);";
    private $requeteBilan = "select jsonBilanPoules();";

    public function __construct(private \PDO $pdo){
    }

    public function getNombreEquipe(int $serie, int $genre): int {
	$valeurs = [':serie' => $serie, ':genre' => $genre];
	$reponse = $this->pdo->prepare($this->requeteNombreEquipeSerieGenre);
	$reponse->execute($valeurs);
	$retour = $reponse->fetch();
	return $retour[0];
    }

    public function getNombreEquipeSansPoule(int $serie, int $genre): int {
	$valeurs = [':serie' => $serie, ':genre' => $genre];
	$reponse = $this->pdo->prepare($this->requeteNombreEquipeSerieGenreSansPoule);
	$reponse->execute($valeurs);
	$retour = $reponse->fetch();
	return $retour[0];
    }

    public function getNombreEquipeAvecPoule(int $serie, int $genre): int {
	$valeurs = [':serie' => $serie, ':genre' => $genre];
	$reponse = $this->pdo->prepare($this->requeteNombreEquipeSerieGenreAvecPoule);
	$reponse->execute($valeurs);
	$retour = $reponse->fetch();
	return $retour[0];
    }

    public function getJsonAvecPoule(int $serie, int $genre): array {
	$valeurs = [':serie' => $serie, ':genre' => $genre];
	$reponse = $this->pdo->prepare($this->requeteJsonEquipeSerieGenreAvecPoule);
	$reponse->execute($valeurs);
	$retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC);
	$liste = !is_null(array_values($retour_[0])[0]) ? json_decode(array_values($retour_[0])[0], true) : null;
	$retour = ['liste' => $liste, 'serie'=> $serie, 'genre' => $genre];
	return $retour;
    }

    public function getJsonSansPoule(int $serie, int $genre): array {
	$valeurs = [':serie' => $serie, ':genre' => $genre];
	$reponse = $this->pdo->prepare($this->requeteJsonEquipeSerieGenreSansPoule);
	$reponse->execute($valeurs);
	$retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC);
	$liste = !is_null(array_values($retour_[0])[0]) ? json_decode(array_values($retour_[0])[0], true) : null;
	$retour = ['liste' => $liste, 'serie'=> $serie, 'genre' => $genre];
	return $retour;
    }

    public function getJsonEquipeIdSouhait(int $serie, int $genre): array {
	$valeurs = [':serie' => $serie, ':genre' => $genre];
	$reponse = $this->pdo->prepare($this->requeteJsonEquipeIdSouhait);
	$reponse->execute($valeurs);
	$retour_ = $reponse->fetchAll(\PDO::FETCH_ASSOC);
	$liste = !is_null(array_values($retour_[0])[0]) ? json_decode(array_values($retour_[0])[0], true) : null;
	$retour = ['liste' => $liste, 'serie'=> $serie, 'genre' => $genre];
	return $retour;
    }

    public function constitutionPoules(string $envoi): void {
	$nettoyee = preg_replace('/[^0-9,:@|]/', '', $envoi);
	$reponse = $this->pdo->prepare($this->requeteConstitutionPoules);
	$reponse->bindValue(':chaine', $nettoyee);
	$reponse->execute();
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
