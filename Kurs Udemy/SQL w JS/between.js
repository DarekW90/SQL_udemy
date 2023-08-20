import mysql from "mysql2/promise"

const connection = await mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "test"
});

await connection.connect();

// w zakresie

function showUsers(info, dbRows) {
    console.log(info);

    dbRows.forEach(r => {
        console.log(r.id, r.name, r.surname, r.bio, r.address, r.age, r.created);
    });
}

async function getUsersBetweenAge(ageFrom, ageTo) {
    const sql = "SELECT * FROM users where age BETWEEN ? and ?"
    const [rows] = await connection.query(sql,[ageFrom, ageTo]);
    return rows;
}

const users1 = await getUsersBetweenAge(30,50);
showUsers("Users with age between 30 and 50: ", users1);

// poza zakresem

async function getUsersNotBetweenAge(ageFrom, ageTo) {
    const sql = "SELECT * FROM users where age NOT BETWEEN ? and ?"
    const [rows] = await connection.query(sql,[ageFrom, ageTo]);
    return rows;
}

const users2 = await getUsersNotBetweenAge(30,50);
showUsers("Users with age not between 30 and 50: ", users2);

// utworzeni pomiędzy datami

function getMySQLDateStr(date) {
    //2023-08-19 19:04:08
    //konwersja formatu daty z obiektu JS na format SQL
    return date.getFullYear()
        + "-" + (date.getMonth()+1).toString().padStart(2,"0")  // wartość getMonth są liczone od "0" trzeba dodać +1 
                                                                // padStart to funkcja JS która wymusza by zapis był wieloznakowy w tym przypadku 2-znakowy z "0" poprzedzającym np 01,05,09 ale 10,11,12 będą już normalne
        + "-" + (date.getDate()).toString().padStart(2,"0") 
        + " " + (date.getHours()).toString().padStart(2,"0") 
        + ":" + (date.getMinutes()).toString().padStart(2,"0")
        + ":" + (date.getSeconds()).toString().padStart(2,"0");
}

function addDaysToDate(date, days) {
    return new Date(date.getTime() + (60 * 60 * 24 * 1000 * days)); // w JS obiekt Date jest liczony w milisekundach
}

const dateFrom = addDaysToDate( new Date(), -3);
console.log("dateFrom: ", dateFrom);

const dateTo = addDaysToDate (new Date(), +1);
console.log("dateTo: ", dateTo);

async function getUsersCreatedBetween(dateFrom, dateTo) {
    const dateFromStr = getMySQLDateStr(dateFrom);
    const dateToStr = getMySQLDateStr(dateTo);

    const sql = "SELECT * FROM users WHERE created BETWEEN ? and ?"
    const [rows] = await connection.query(sql, [dateFromStr, dateToStr]);
    return rows;
}

const users3 = await getUsersCreatedBetween(dateFrom, dateTo);
showUsers("Users created between dates: ", users3);

