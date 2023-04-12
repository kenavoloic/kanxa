<!doctype html>
<html lang="fr">
    <head>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <meta charset="UTF-8"/>
	<link href="css/style.css"  rel="stylesheet" type="text/css" />
        <title><?= $titre; ?></title>
    </head>
    <body>
	<header>
	    <h1><a href="#">Kanxa</a></h1>
	    <nav>
		<div id="vegan">
		    <div class="lignes"></div>
		    <div class="lignes"></div>
		    <div class="lignes"></div>
		</div>
		<ul class="liens" id="liens">
		    <li><a href="/dates" title="Prochaines parties">Calendrier</a></li>
		    <li><a href="#" title="Résultats par série, par genre">Résultats</a></li>
		    <li><a href="#" title="Classements des poules,  par série, par genre">Classements</a></li>
		    <li><a href="#" title="Vos remarques, vos doléances">Réclamations</a></li>
		    <li><a href="#" title="Administrateur">Login</a></li>
		</ul>
	    </nav>
	</header>
	<main>
	    <article class="partie">
		<div id="serieGenrePoule">
		    <label htmlFor="serie">Série</label>
		    <select id="serie" name="serie">
			<option value="1">Première</option>
			<option value="2">Deuxième</option>
			<option value="3">Troisième</option>
		    </select>
		    
		    <label htmlFor="genre">Série</label>
		    <select id="genre" name="genre">
			<option value="h">Homme</option>
			<option value="f">Femme</option>
			<option value="x">Mixte</option>
		    </select>

		    <label htmlFor="poule">Série</label>
		    <select id="poule" name="poule">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		    </select>
		    
		</div>
		<div id="date">
		    <p>13-02-2023</p>
		    <p>15h00</p>
		</div>
		<div id="equipe1">
		    <p>equipe1</p>
		    <p><span>311</span><span>Dupond</span><span>Nemours</span></p>
		    
		</div>
		<div id="equipe2">
		    <p>equipe2</p>
		    <p><span>312</span><span>Smith</span><span>Wesson</span></p>
		</div>
	    </article>
	    <p>Résultats</p>
	    serie genre poule
	    date
	    equipe1
	    equipe2

	</main>
    </body>
</html>
