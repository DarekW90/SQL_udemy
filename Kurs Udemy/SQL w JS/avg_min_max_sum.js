import mysql from "mysql2/promise"

const connection = await mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "test"
});

await connection.connect();


async function getAvgAge() {
    const sql = "SELECT AVG(age) as avgAge FROM users";
    const [rows] = await connection.query(sql);

    return rows.pop().avgAge;

}

const avgAge = await getAvgAge();

console.log("Average age: ", avgAge);

// zaokrąglanie

async function getAvgRoundAge() {
    const sql = "SELECT ROUND(AVG(age), 2) as avgAge FROM users"; // 2 miejsca po przecinku
    const [rows] = await connection.query(sql);

    return rows.pop().avgAge;

}

const avgRoundAge = await getAvgRoundAge();

console.log("Average age: ", avgRoundAge);

// count

async function countUsers() {
    const sql = "SELECT COUNT (id) as numUsers FROM users";
    const [rows] = await connection.query(sql);

    return rows.pop().numUsers;

}

const numUsers = await countUsers();
console.log("Num users: ", numUsers);

// max wartość

async function getMaxAge() {
    const sql = "SELECT MAX(age) as maxAge FROM users";
    const[rows] = await connection.query(sql);
    return rows.pop().maxAge;
}

const maxAge = await getMaxAge();
console.log("Max Age: ", maxAge);

// min wartość

async function getMinAge() {
    const sql = "SELECT MIN(age) as minAge FROM users";
    const[rows] = await connection.query(sql);
    return rows.pop().minAge;
}

const minAge = await getMinAge();
console.log("Min Age: ", minAge);


// suma

async function sumAge () {
    const sql = "SELECT SUM(age) as sumAge FROM users";
    const[rows] = await connection.query(sql);
    return rows.pop().sumAge;
}

const ageSum = await sumAge();
console.log("Age sum: ", ageSum);