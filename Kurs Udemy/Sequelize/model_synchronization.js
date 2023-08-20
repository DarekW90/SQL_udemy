import {DataTypes, Sequelize} from "sequelize";

const sequelize = new Sequelize("test","root","", {
    host:"localhost",
    dialect: "mysql",
    decimalNumbers: true
});

sequelize.authenticate().then(() => {
    console.log('Connection has been established successfully.');
}).catch((error) => {
    console.error('Unable to connect to the database: ', error);
});

// model Konsoli

const Console = sequelize.define("Console", { // consoles - wyłączenie przez freezeTableNames
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    brand: {
        type: DataTypes.STRING,
        allowNull: false
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    ramSize: {
        type: DataTypes.INTEGER,
        allowNull: false,
        comment: "In megabytes"
    }
}, {
    freezeTableName: true, // wyłączenie zamiany nazwy na liczbę mnogą
    tableName: "consoles"  // konkretne nazwanie tabeli
})

await Console.sync(); // jeżeli tabela consoles juz istnieje to sync() nic nie zrobi,
                      // ale jeśli nie ma tabeli consoles to zostanie utworzona

// Synchronizuje wszystkie utworzone wcześniej modele z bazą danych
await sequelize.sync().then(() => {
    console.log('Table created successfully!');
}).catch((error) => {
    console.error('Unable to create table: ', error);
});

await Console.create({
    brand: "Playstation",
    name: "PS2",
    ramSize: 32
});


// update tabeli

const ConsoleUpdated = sequelize.define("Console", {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    brand: {
        type: DataTypes.STRING,
        allowNull: false
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    ramSize: {
        type: DataTypes.INTEGER,
        allowNull: false,
        comment: "In megabytes"
    },
    cpu: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    freezeTableName: true, // wyłączenie zamiany nazwy na liczbę mnogą
    tableName: "consoles"  // konkretne nazwanie tabeli
})

await ConsoleUpdated.sync({ force: true });
// force: true - wymusza wytworzenie tabeli poprzez usunięcie starej razem z rekordami i jednoczesne utworzenie nowej

await Console.create({
    brand: "Playstation",
    name: "PS3",
    ramSize: 512,
    cps: "Cell"
});

const ConsoleAltered = sequelize.define("Console", {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    brand: {
        type: DataTypes.STRING,
        allowNull: false
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    ramSize: {
        type: DataTypes.INTEGER,
        allowNull: false,
        comment: "In megabytes"
    },
    cpu: {
        type: DataTypes.STRING,
        allowNull: false
    },
    gpu: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    freezeTableName: true, // wyłączenie zamiany nazwy na liczbę mnogą
    tableName: "consoles"  // konkretne nazwanie tabeli
})

await ConsoleAltered.sync({ alter: true });
// alter: true - sprawdza czy poprzednia wersja jest aktualna, jeśli nie to utworzy nowe brakujące elementy
// NIE kasuje aktualnych rekordów

await ConsoleAltered.create({
    brand: "Playstation",
    name: "PS4",
    ramSize: 8000,
    cpu: "AMD",
    gpu: "AMD"
})



await sequelize.close();