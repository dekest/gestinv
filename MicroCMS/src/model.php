<?php
	
class BDD {
	public $connexion;
	function __construct($nombdd){			
	//cette fonction permet de se connecter au SGBD et à une base de données
		$message="";
		$PARAM_nom_bd="$nombdd"; // le nom de votre base de données
		$PARAM_utilisateur='root'; // nom d'utilisateur pour se connecter
		$PARAM_mot_passe=''; // mot de passe de l'utilisateur pour se connecter
		$PARAM_hote='localhost'; // le chemin vers le serveur
		$pdo_options[PDO::MYSQL_ATTR_INIT_COMMAND] = "SET NAMES 'UTF8'";//encodage utf-8
		try{
			$this->connexion = new PDO("mysql:host=$PARAM_hote;dbname=$PARAM_nom_bd", $PARAM_utilisateur, $PARAM_mot_passe,$pdo_options);	
			$this->connexion->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
		}
		catch(PDOException $e){
		
			$message="probleme de connexion a la base : ";
			$message=$message.$e->getMessage();
			echo "message $message";
			return $message;
		}

		return $this->connexion;
	}
        
        
        function select ($requete){
		$message="";
		try{
			$resultats=$this->connexion->query($requete);
			$tab=$resultats->fetchALL(PDO::FETCH_ASSOC); // on dit qu'on veut que le résultat soit récupérable sous forme de tableau)
		}
		catch(PDOException $e){
			$message="probleme pour executer cette requete $requete : ";
			$message=$message.$e->getMessage();
			echo $message;
		}
		
		return $tab;
	}
}


/*try
{
    $bdd = new PDO('mysql:host=localhost;dbname=test;charset=utf8', 'root', '', 
            array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
}
catch (Exception $e)
{
        die('Erreur : ' . $e->getMessage());
}*/
