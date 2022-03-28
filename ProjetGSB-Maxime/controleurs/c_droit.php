<?php
$action = $_GET['action'];
switch($action){
	
	case 'demandeModification':{
            if ($_SESSION['id'] == 1){
            include("vues/admin/v_modificationCompte.php");            
            }else{
                include("vues/user/v_modificationCompte_Utili.php"); 
            }
		break;
}
        case 'modification':{
            $nom=$_POST['nom'];
            $prenom=$_POST['prenom'];
            $id=$_SESSION['id'];
            $mdp= htmlspecialchars($_POST['Modifmdp1']);
            $mdp2= htmlspecialchars($_POST['Modifmdp2']);
            $pdo= PdoGsb::getPdoGsb();
            $rempli=false;            
            if (empty($mdp)==true && empty($mdp2)==true){
                $modifSansMdp=$pdo->modifNomPrenom($nom,$prenom,$id);
                include ("vues/user/v_modificationCompte_Utili.php");
                $message="<h3 class='text-center'>Modification effectuée !</h3>";
                echo $message;
                        
            $rempli=false; }
            else{
                if(verif2Strings($mdp, $mdp2)==true){
                    if(verifSecuPWP($mdp)){
                        $modifAvecMdp=$pdo->modifNomPrenomMdp($nom,$prenom,$mdp,$id);
                        include ("vues/user/v_modificationCompte_Utili.php");
                        $message="<h3 style='color: red;'>Modification effectuée !</h3>";
                        echo $message;
                    }

                }
                else{
                    include ("vues/user/v_modificationCompte_Utili.php");
                    echo '<h3 style="color: red;">Les mots de passes ne sont pas similaires !</h3>';
                    }
                }  break;
                } 
                
                
        case 'supprimer':{
            $id=$_SESSION['id'];
            $pdo= PdoGsb::getPdoGsb();
            $coche=false;
                if(!isset($_POST['suppr'])){
                    include ("vues/user/v_modificationCompte_Utili.php");
                    echo '<h3 style="color: red;">Veuillez cocher la case \'SUPPRIMER\' pour supprimer votre compte</h3>';
                    $coche=false;
                    break;
        }
           else{
               $coche=true;
               $supprCompte=$pdo->supprimerCompte($id);
                        
               include("vues/v_connexion.php");		
               echo '<h2 style="color: red;">Votre compte à bien été supprimé ! See you soon !</h2>';
               
               break;
           }        
        }
        
        case 'archiver':{
            $pdo= PdoGsb::getPdoGsb();
            $id=$_SESSION['id'];
            $tabMed = PdoGsb::RecupMedecinArchiver($id);
            $tabProduit = PdoGsb::RecupProduitArchiver($id);
            $tabVisio = PdoGsb::RecupVisioArchiver($id);
            $tabHistorique = PdoGsb::RecupHistoriqueArchiver($id);            
             
            if (isset($_POST['archive'])){
                
            $dateNaiss = $tabMed['dateNaissance'];
            $dateCrea = $tabMed['dateCreation']; 
            
            
            $newIdMed = PdoGsb::AjouteArchivageMedecin($dateNaiss, $dateCrea);           
            $dateDebutLog;
            $dateFinLog;
            foreach ($tabHistorique as $medecin){
                   $dateDebutLog = $medecin['dateDebutLog'];
                   $dateFinLog = $medecin['dateFinLog'];
                   PdoGsb::AjouteArchivageHistorique($newIdMed, $dateDebutLog, $dateFinLog);
            }
             
            $idP;
            $dateP;
            $heureP;
            foreach ($tabProduit as $medecin){
                $idP = $medecin['idProduit'];
                $dateP = $medecin['Date'];
                $heureP = $medecin['Heure'];
                PdoGsb::AjouteArchivageMedecinProduit($newIdMed, $idP, $dateP, $heureP);
            }
                
            $idVisio;
            $dateInscription;             
            foreach ($tabVisio as $medecin){
                $idVisio = $medecin['idVisio'];
                $dateInscription = $medecin['dateInscription']; 
                PdoGsb::AjouteArchivageVisio($newIdMed, $idVisio, $dateInscription);
             }
             
             $pdo->supprimerCompte($id);             
             
             include("vues/v_connexion.php");
             echo '<h2 style="color: red;">Votre compte à bien été archivé ! See you soon !</h2>';
             
             
             break;
             
            } else {
                include ("vues/user/v_modificationCompte_Utili.php");
                echo '<h3 style="color: red;">Veuillez cocher la case \'ARCHIVER\' pour archiver votre compte</h3>';
                break;
            }
               
        } 
        
        case 'cookiesAccepter':{
            setcookie("Accepter-cookie", 'true', time()+15778800);            
            include('vues/v_connexion.php');
            $_SESSION['$showcookie'] = false;
            break;
        }
         
         case 'cookiesRefuser':{
            setcookie("Refuser-cookie", 'false');           
            include('vues/v_connexion.php');
            $_SESSION['$showcookie'] = false;
            break;
        }
        
        
        case 'json':{
            $id=$_SESSION['id'];
           
            $nom;
            $prenom;
            $mail;
            $rpps;
            $dateConsentement;
            $dateCrea;
            $dateNaiss;
            $tab = PdoGsb::RecupInfoMedecin($id);
            foreach ($tab as $info){
                $nom=$info['nom'];
                $prenom=$info['prenom'];
                $mail=$info['mail'];
                $rpps=$info['rpps'];
                $dateConsentement=$info['dateConsentement'];
                $dateCrea=$info['dateCreation'];
                $dateNaiss=$info['dateNaissance'];                
            }
            PdoGsb::toJson($nom, $prenom, $mail, $dateNaiss, $dateCrea, $rpps, $dateConsentement);
            include('vues/user/download.php');
            include('vues/user/v_recupDonnees.php');
            break;    
        }
        
        }
               
        ?>