<?php
//on insère le fichier qui contient les fonctions
require_once ("../include/class.pdogsb.inc.php");

//appel de la fonction qui permet de se connecter à la base de données
$lePdo = PdoGsb::getPdoGsb();
$mail="toto@gmail.com";
$mail2="toto@gmail.com";

var_dump(PdoGsb::hashMail($mail)); 
var_dump(PdoGsb::hashMail($mail2)); 


