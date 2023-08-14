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

    // inner join - zwraca połączone rekordy z obu tabel

    $sql = <<<TEST
        SELECT employees.name, employees.surname, 
        computers.id, computers.brand, computers.model, computers.employee_id
        FROM employees
        INNER JOIN computers ON employees.id = computers.employee_id
    TEST;

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo (
                "<br> name:".$row["name"]." surname:".$row["surname"].
                " brand:".$row["brand"]." model:".$row["model"]." employee_id:".$row["employee_id"]
            );
        }
    }


    $conn ->close();
    ?>
</body>
</html>



