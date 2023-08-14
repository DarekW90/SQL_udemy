<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        $con = mysqli_connect("localhost","root","");
        mysqli_select_db($con, "tutorial");

        // tworzenie tabeli

        mysqli_query($con,"CREATE TABLE IF NOT EXISTS users(id INT NOT NULL AUTO_INCREMENT, name VARCHAR(128), surname VARCHAR(128), city VARCHAR(128), country VARCHAR(64), PRIMARY KEY(id))");
        
        // dodawanie rekordow

        mysqli_query($con, "INSERT INTO users(name, surname, city, country) VALUES ('Kasia', 'Kowalska', 'Wawa', 'PL')");
        mysqli_query($con, "INSERT INTO users(name, surname, city, country) VALUES ('Karol', 'Kowalski', 'Krk', 'PL')");

        // zamykanie połączenia
        
        mysqli_close($con);


        echo("Koniec programu");
        //mysqli_query($con, "CREATE TABLE IF NOT EXISTS users (ID INT, name VARCHAR(128), surname VARCHAR(128), city VARCHAR(128), country VARCHAR(64))")

    ?>
</body>
</html>