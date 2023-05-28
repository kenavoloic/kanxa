<article id="brassage">
<?= $this->getComposant('boutonInvisible') ?>
<section id="cadre">
    <article id="equipes">
	<h2>Équipes</h2>
	<?= $tableau['lignes'] ?>
    </article>

    <article id="poules">
	<h2>Poules</h2>
	<article class="poule" id="d1"><h3 class="titre"><span id="bat">Poule 1</span></h3><div class="depot" id="p1"></div></article>
	<article class="poule" id="d2"><h3 class="titre"><span id="bi">Poule 2</span></h3><div class="depot" id="p2"></div></article>
	<article class="poule" id="d3"><h3 class="titre"><span id="hiru">Poule 3</span></h3><div class="depot" id="p3"></div></article>
	<article class="poule" id="d4"><h3 class="titre"><span id="lau">Poule 4</span></h3><div class="depot" id="p4"></div></article>
    </article>
</section>
</article>
