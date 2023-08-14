<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    $conn = new mysqli ("localhost", "root", "", "testdb");

    //format HEREDOC

    //tworzenie tabeli

    $sql = <<<TEST
        CREATE TABLE IF NOT EXISTS computers (
            id int(6) AUTO_INCREMENT PRIMARY KEY,
            employee_id INT(6),
            brand VARCHAR(24),
            model VARCHAR(24),
            FOREIGN KEY (employee_id) REFERENCES employees(id)
        );
    TEST;

    // dodawanie informacji do tabel
    // CRUD

    // C - Create
    // R - Read
    // U - Update
    // D - Delete

    $sql2 = <<<TEST
        INSERT INTO computers (employee_id, brand, model)
        VALUES (1, 'Dell', 'Inspiron x1'),
        (2, 'Dell', 'Inspiron x2'),
        (3, 'Dell', 'Inspiron x3'),
        (4, 'Dell', 'Inspiron x4');
    TEST;

    $sql3 = <<<TEST
        SELECT * from computers;
    TEST;

    // UPDATE

    $sqlUpdate = <<<TEST
        UPDATE computers SET brand="Compaq" WHERE id >= 2
    TEST;

    if ($conn->query($sqlUpdate) === TRUE) {
        echo("db ok<br>");
    }

    // DELETE 

    $sqlDelete = <<<TEST
        DELETE FROM computers WHERE id = 3;
    TEST;

    $result = $conn->query($sqlDelete);

    $sql3 = <<<TEST
        SELECT * from computers;
    TEST;

    $result = $conn->query($sql3);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo (
                "id ".$row["id"].
                " brand ".$row["brand"].
                " model ".$row["model"].
                " employee_id".$row["employee_id"].
                "<br>"
            );
        }
    }

    /*if ($conn->query($sql2) === TRUE) {
        echo("db ok");
    } */

    $conn ->close();
    ?>
</body>
</html>



