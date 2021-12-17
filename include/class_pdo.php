<?php

class myPdo{
    private static  $serveur='mysql:host=localhost';
    private static  $bdd='dbname=bdblog';
    private static  $user='root';
    private static  $mdp='';
    private static  $pdo;
    private static  $myPdo=null;

    private function __construct(){
        myPdo::$pdo = new PDO(myPdo::$serveur.';'.myPdo::$bdd,myPdo::$user, myPdo::$mdp);
        myPdo::$pdo->query("SET CHARACTER SET utf8");
    }

    public function __destruct(){
        myPdo::$myPdo = null;
    }

    public static function getMyPdo(){
        if(myPdo::$myPdo == null){
            myPdo::$myPdo = new myPdo;
        }
        return myPdo::$myPdo;
    }

    
    public function getArticles(){
        $req = 'SELECT article.NumArt as id, article.TitreArt as titre, article.ContenuArt as contenu, article.AuteurArt as auteur, 
                article.DateCreaArt as dateCrea FROM article';
        $res = myPdo::$pdo->query($req);
        $lesLignes = array();
        while($laLigne = $res->fetch()){
            $lesLignes[] = $laLigne;
        }
        return $lesLignes;
    }
    

    public function getComments(int $id){
        $req = 'SELECT commentaire.ContenuComm as contenu, commentaire.DateCreaComm as dateCrea, 
                commentaire.AuteurComm as auteur FROM commentaire WHERE commentaire.NumArt='.$id;   
        $res = myPdo::$pdo->query($req);
        $lesLignes = array();
        while($laLigne = $res->fetch()){
            $lesLignes[] = $laLigne;
        }
        return $lesLignes;
    }
}

?>