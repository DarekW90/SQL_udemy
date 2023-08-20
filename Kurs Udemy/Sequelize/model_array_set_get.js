/*
    Sequelize
    Zadanie:
    1. Połącz się z bazą mysql test
    2. Stwórz model opisujący Telewizor z modelem Tv dodaj pola:
        - id - jako UUID z domyślną wartością UUIDV4, PRIMARY KEY
        - brand - STRING
        - model - STRING
        - screenSize - DECIMAL(5,2)
        - isRlcd - Boolean, domyślna wartość false
        - color to enum wartości: black, silver, white
        - purchaseDate - data zakupu, domyślnie aktualny czas
        - channels - to emulowany typ array z listą kanałów jako String, użyj typ String oraz getter i setter
    3. Stwórz instancję telewizora i zapisz ją do bazy danych
*/

import {BOOLEAN, DataTypes, Sequelize} from "sequelize";

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

// Model
const Tv = sequelize.define("TV", {
    id: {
        type: Sequelize.UUID,
        defaultValue: Sequelize.UUIDV4,
        primaryKey: true
    },
    brand: {
        type: DataTypes.STRING(12),
        allowNull: false
    },
    model: {
        type: DataTypes.STRING(24),
        allowNull: false
    },
    screenSize: {
        type: DataTypes.DECIMAL(5,2),
        allowNull: true,
        defaultValue: 24
    },
    isRlcd: {
        type: DataTypes.BOOLEAN,
        defaultValue: false,
        allowNull: false
    },
    color: {
        type: DataTypes.ENUM("black","silver","white"),
        allowNull: false,
        defaultValue: "black"
    },
    purchaseDate: {
        type: DataTypes.DATE,
        defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
        allowNull: false
    },
    channels: {
        type: DataTypes.STRING,
        allowNull: false,
        get() {
            return this.getDataValue("channels").split(",");
        },
        set(v) {
            this.setDataValue("channels",v.join(","));
        }
    }
})

await sequelize.sync().then(() => {
    console.log('Truck table created successfully!');
}).catch((error) => {
    console.error('Unable to create table: ', error);
});

await Tv.create({
    brand: "SVD",
    model: "PC RLCD Monitor",
    screenSize: 32,
    isRlcd: true,
    purchaseDate: new Date(),
    color: "black",
    channels: ["hdmi #1", "hdmi #2"]
});

await sequelize.close();