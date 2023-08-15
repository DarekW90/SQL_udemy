import mysql from "mysql2/promise"

const connection = await mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "test"
});

const sql1 = "SELECT * FROM users WHERE name = ? AND age > ?"

const [rows] = await connection.execute(sql1, ["Ola", 22]); // dane dla zapytania podstawiane zamiast "?" pierwsza odpowiada pierwszemu znakowi, druga drugiemu etc...

console.log("num rows:", rows.length);
console.log("rows: ", rows);