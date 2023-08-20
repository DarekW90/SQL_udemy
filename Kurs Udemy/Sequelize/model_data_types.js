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

const Truck = sequelize.define("Truck", {
    id: {
        type: DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    vin: {
        type: Sequelize.UUID,
        // universal unique ID
        defaultValue: Sequelize.UUIDV4
    },
    brand: {
        type: DataTypes.STRING(12),
        allowNull: false
    },
    name: {
        type: DataTypes.STRING(24),
        allowNull: false
    },
    description: {
        type: DataTypes.TEXT(), // bazowo maksymalnie 16.000.000 znaków
        allowNull: true
    },
    horsePower: {
        type: DataTypes.DECIMAL(5,2), // 123.45 - pięć cyfr w tym dwie cyfry po przecinku
        allowNull: true
    },
    topSpeed: {
        type: DataTypes.DECIMAL(5,2),
        allowNull: true
    },
    numDoors: {
        type: DataTypes.INTEGER(2),
        defaultValue: 2,
        allowNull: true
    },
    isElectric: {
        type: DataTypes.BOOLEAN,
        defaultValue: false,
        allowNull: true
    },
    color: {
        type: DataTypes.ENUM("white","red","blue","green","black","yellow"), // ENUM - można wybrać tylko jeden z podanych
        allowNull: false,
        defaultValue: "blue"
    },
    releaseDate: {
        type: DataTypes.DATE,
        defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
        allowNull: false
    },
    lastMechCheck: {
        type: DataTypes.DATEONLY,
        allowNull: true
    },
    customOptions: {
        type: DataTypes.JSON,
        allowNull: true
    },
}, {
    underscored: true // customOptions zmieni się na custom_options => snake_case
});

await sequelize.sync().then(() => {
    console.log('Truck table created successfully!');
}).catch((error) => {
    console.error('Unable to create table: ', error);
});


await Truck.create({
    brand: "Kenworth",
    name: "T800",
    description: "Most popular truck in USA",
    horsePower: 300.55,
    topSpeed: 130.23,
    isElectric: false,
    releaseDate: new Date (2020,1,5,17,56,23),
    lastMechCheck: new Date (2023,2,12),
    customOptions: JSON.stringify({
        leatherSeats: true,
        extendedCabin: true
    })
});

await sequelize.close();