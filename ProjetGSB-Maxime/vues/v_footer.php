<style>
    footer{
        text-align:center;
        position: absolute;
        width:100%;
    }
    
    .btnR{
        background-color: white;
        color : black;
        font-size: 15px;
    }
</style>

<footer id="footer" class)="panel-footer">
    <?php if($_SESSION['$showcookie']) { ?> 

<div>
   En poursuivant votre navigation sur ce site, vous acceptez l’utilisation de cookies pour vous proposer des contenus et services adaptés à vos centres d’intérêts.
   <br /><b><a class="btn btnR" href="index.php?uc=droit&action=cookiesRefuser">Refuser</a> | <a class="btn btnR" href="index.php?uc=droit&action=cookiesAccepter">Accepter</a></b>
</div>

<?php } ?>
            
    <h2>Voici le lien vers la <a href="vues/v_politiqueprotectiondonnees.html">Politique de protection des données</a></h2>
     
 </footer>