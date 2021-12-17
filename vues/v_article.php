<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://fonts.googleapis.com/css?family=Rock+Salt' rel='stylesheet' type='text/css'>
    <link href="style.css" type="text/css" rel="stylesheet">
    <title>Mes articles</title>
</head>
<body>
    <h2>Nos articles récents</h2>
    <div class="articles">
        <table id="articles">
            <thead>
                <tr>
                    <th>Titre</th>
                    <th>Contenu</th>
                    <th>Auteur</th>
                    <th>Date de création</th>
                </tr>
            </thead>
            <tbody>
            <?php 
            $res = array();
            $res = $pdo->getArticles();
            
            foreach( $res as $article ){
                $dateModif = new DateTime($article['dateCrea']);
                echo'<tr> 
                        <td> '.$article['titre'].' </td> 
                        <td class="contenu"> '.$article['contenu']. '</td> 
                        <td> '.$article['auteur'].' </td> 
                        <td> '.date_format($dateModif, 'd-m-Y')."  
                        <a href='./vues/v_commentaire.php?id=".$article['id']."'>Commentaires</a>
                        </td>
                    </tr>";
            }
            ?>
            </tbody>
        </table>
    </div>
</body>
</html>