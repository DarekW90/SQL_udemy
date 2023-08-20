/*
    Sequelize to ORM - Object Relational Mapping w Node.js dla bazy PostgreSQL, MySQL, MSSQL,SQLite. 
    ORM to odwzorowanie obiektowej architektury systemu informatycznego na bazę danych mającą relacyjny charakter. 
    W praktyce oznacza zmianę danych w postaci abelarycznej na obiekty i w drugą stronę.

    npm install mysql2 sequelize
    w package json type jako module
*/

import {Sequelize} from "sequelize";

// logowanie do bazy
const sequelize = new Sequelize("test","root","", {
    host:"localhost",
    dialect: "mysql",
});

try {
    await sequelize.authenticate();
    console.log("Connected to database.");
    await sequelize.close();
}catch (error) {
    console.error("Unable to connect to database: ", error)
}