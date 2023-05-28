<article id="pafBilan">
    <dl><dt>Nombre d’équipes engagées</dt><dd class="avec"><?= $tableau['nombre'] ?></dd></dl>
    <dl><dt>Équipes ayant réglé</dt><dd class="avec"><?= $tableau['ajour'] ?></dd></dl>
    <dl><dt>Équipes devant régler</dt><dd class="sans"><?= $tableau['retard'] ?></dd></dl>

    <dl><dt>Première série masculine</dt><dd class="avec">À jour <?= $tableau['aj11'] ?></dd><dd class="sans">Retard <?= $tableau['r11'] ?></dd></dl>
    <dl><dt>Première série féminine</dt><dd class="avec">À jour<?= $tableau['aj12'] ?></dd><dd class="sans">Retard <?= $tableau['r12'] ?></dd></dl>

    <dl><dt>Deuxième série masculine</dt><dd class="avec">À jour<?= $tableau['aj21'] ?></dd><dd class="sans">Retard <?= $tableau['r21'] ?></dd></dl>
    <dl><dt>Deuxième série féminine</dt><dd class="avec">À jour<?= $tableau['aj22'] ?></dd><dd class="sans">Retard <?= $tableau['r22'] ?></dd></dl>

    <dl><dt>Troisième série masculine</dt><dd class="avec">À jour<?= $tableau['aj31'] ?></dd><dd class="sans">Retard <?= $tableau['r31'] ?></dd></dl>
    <dl><dt>Troisième série féminine</dt><dd class="avec">À jour<?= $tableau['aj32'] ?></dd><dd class="sans">Retard <?= $tableau['r32'] ?></dd></dl>    
</article>
