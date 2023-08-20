import mysql from "mysql2/promise"

const connection = await mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "test"
});

await connection.connect();

function showUsers(info, dbRows) {
    console.log(info);

    dbRows.forEach(r => {
        console.log(r.id, r.name, r.surname, r.bio, r.address, r.age, r.created);
    });
}

// zaczynające się na ....

async function getUsers1(prefix) {
    const str = prefix + "%"; // "A%" pobierzemy wszystkie imiona zaczynające się na litere A
    const sql = "SELECT * FROM users WHERE name LIKE ?";
    const [rows] = await connection.query(sql, [str]);
    return rows;
}

const users1 = await getUsers1("A");
showUsers("Users starting with 'A': ", users1);

// kończące się na ....

async function getUsers2(sufix) {
    const str = "%" + sufix ; // "%A" pobierzemy wszystkie imiona kończące się na litere A
    const sql = "SELECT * FROM users WHERE name LIKE ?";
    const [rows] = await connection.query(sql, [str]);
    return rows;
}

const users2 = await getUsers2("a");
showUsers("Users ending with 'a': ", users2);

// z literą w środku

async function getUsers3(str) {
    str = "%" + str + "%"; // "%A%" pobierzemy wszystkie imiona z litera "u" w środku
    const sql = "SELECT * FROM users WHERE name LIKE ?";
    const [rows] = await connection.query(sql, [str]);
    return rows;
}

const users3 = await getUsers3("u");
showUsers("Users with 'u' inside name: ", users3);

// z konkretną literą w środku

async function getUsers4(thirdLetter) {
    const str = "__" + thirdLetter + "%"; // "__s%" // trzecia litera to "s"
    const sql = "SELECT * FROM users WHERE name LIKE ?";
    const [rows] = await connection.query(sql, [str]);
    return rows;
}

const users4 = await getUsers4("s");
showUsers("Users with thrid letter ('s'): ", users4);

// pierwsza litera i minimalna liczba znaków

async function getUsers5(firstLetter) {
    const str = firstLetter + "__%"; // "K__s%" // pierwsza litera to K potem MUSZĄ wystąpić 2 dowolne litery i dowolne kolejne - może być Kot jak i Koteczek :)
    const sql = "SELECT * FROM users WHERE name LIKE ?";
    const [rows] = await connection.query(sql, [str]);
    return rows;
}

const users5 = await getUsers5("K");
showUsers("Users with first letter 'K' and min 3 letters: ", users5);