<?php
    include('../MicroCMS/src/model.php');
 
$connexion=new BDD('gestinv1');
$message="";
$requete = "select nomClient, nomSite, numeroImmo, nomTypeequipement, numserie "
        . "from client, site, immobilisation, typeequipement";
$tab_inv=$connexion->select($requete);
?>

<!DOCTYPE html>
<html>
<head>
	<?php
	/** Inclusion des différents paramètres présent dans l'élément head commum aux pages */
	//include("struct/param_headAccueil.php");
	?>
        <link rel="stylesheet" type="text/css" href="css/connexion.css">
	<title>Gestion d'inventaire LMS Informatique</title>
</head>
<body>
    <div id='cadre'>
        <header><h1>Inventaire</h1></header>
	
<section>
	<h1> Inventaire </h1>
  <table cellspacing='10'><tr><th> Client </th>
<th> Site </th><th> n° Immo </th><th> Type d'équipement</th><th> n° Serie </th></tr>
<?php

foreach ($tab_inv as $ligne){

    //on crée un lien sur le numero de dt qui permet d'aller sur la page affichant le détail de cette dt
   echo "<tr><td>".$ligne['nomClient']."</td>\n";
    
   echo "<td>". $ligne['nomSite']."</td><td>".$ligne['numeroImmo']."</td>
       <td>".$ligne['Typeequipement']."</td><td>".$ligne['numserie']."</td></tr>";
}
echo "</table>";

echo "<h3>$message</h3>";
?>
</section>