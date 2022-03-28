<?php
//on insère le fichier qui contient les fonctions
require_once ("../include/class.pdogsb.inc.php");

//appel de la fonction qui permet de se connecter à la base de données
$lePdo = PdoGsb::getPdoGsb();

$dateNaiss="2000";
$crea="2021-10-10";
$heure="16:00:00";
$date="2021-10-12";
$idProd="1";
$id= PdoGsb::AjouteArchivageMedecin($dateNaiss, $crea);
$dateDebutLog="2021-10-25";
$dateFinLog="2021-10-26";
$idVisio=8;
$dateInscri="2021-06-30";

PdoGsb::AjouteArchivageMedecinProduit($id, $idProd, $date, $heure);
PdoGsb::AjouteArchivageHistorique($id,$dateDebutLog, $dateFinLog);
var_dump(PdoGsb::AjouteArchivageVisio($id, $idVisio, $dateInscri));
