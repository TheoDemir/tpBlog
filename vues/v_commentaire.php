<?php
// require_once('../include/class_article.php');
require_once('../include/class_pdo.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://fonts.googleapis.com/css?family=Rock+Salt' rel='stylesheet' type='text/css'>
    <link href="../style.css" rel="stylesheet" type="text/css">
    <title>Commentaires</title>
</head>

<body>
    <h2>Commentaires</h2>

    <div>
        <table id="commentaires">
            <thead>
                <tr>
                    <th>Auteur</th>
                    <th>Contenu</th>
                    <th>Date de création</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $pdo = myPdo::getMyPdo();
                $res = array();
                $res = $pdo->getComments($_GET['id']);

                foreach ($res as $commentaire) {
                    $dateModif = new DateTime($commentaire['dateCrea']);
                    echo '<tr> 
                            <td> ' . $commentaire['auteur'] . ' </td> 
                            <td> ' . $commentaire['contenu'] . '</td>
                            <td> ' . date_format($dateModif, 'd-m-Y') . " </td> 
                        </tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
</body>

</html>