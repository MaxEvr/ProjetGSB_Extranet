<?php

//on insère le fichier qui contient les fonctions
require_once ("../include/class.pdogsb.inc.php");

//appel de la fonction qui permet de se connecter à la base de données
$lePdo = PdoGsb::getPdoGsb();

$nom = "Evr";
$prenom = "Max";
$mail = "max@gmail.com";
$rpps = "1";
$dateConsentement = "2021-07-10";
$dateCrea = "2021-07-10";
$dateNaiss = "2002-07-01";     

var_dump(PdoGsb::toJson($nom, $prenom, $mail, $dateNaiss, $dateCrea, $rpps, $dateConsentement));


