<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php

    // połączenie do bazy danych - "adres" / "login" / "haslo" / "baza danych"

    $mysqli = new mysqli("localhost","root","","tutorial");
    
    $sql = "SELECT id, name, surname, city, country FROM users";

    $result = $mysqli-> query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) { 
            // metoda fetch_assoc - wywołanie wiersza w formacie tabeli asocjacyjnej
            echo(
                $row["id"]." ".
                $row["name"]." ".
                $row["surname"]." ".
                $row["city"]." ".
                $row["country"].
                "<br>");
        }
    }

    mysqli_free_result($result);

    $mysqli -> close();



    echo("Koniec programu");
    ?>
</body>
</html>