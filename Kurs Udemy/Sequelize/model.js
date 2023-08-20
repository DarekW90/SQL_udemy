import {DataTypes, Sequelize} from "sequelize";

// logowanie do bazy
const sequelize = new Sequelize("test","root","", {
    host:"localhost",
    dialect: "mysql",
});

try {
    await sequelize.authenticate();
    console.log("Connected to database.");
    //await sequelize.close();
}catch (error) {
    console.error("Unable to connect to database: ", error)
}

const Animal = sequelize.define("Animal",{
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    type: {
    type: DataTypes.STRING,
    allowNull: true
    },
    numLegs: {
        type: DataTypes.INTEGER, 
        defaultValue: 2,
        allowNull: true
    },
    createdAt: {
        type: DataTypes.DATE,
        defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
        allowNull: false
    }
});

await sequelize.sync().then(()=> {
    console.log("Animal table created");
}).catch(error => {
    console.log("Error when creating table: ", error);
});


await Animal.create({
    name: "Parrot",
    type: "bird"
}).then(res => {
    console.log(res);
}).catch(error => {
    console.log("Error when saving to database: ", error);
});

await Animal.create({
    name: "Shiba Inu",
    type: "Dog"
}).then(res => {
    console.log(res);
}).catch(error => {
    console.log("Error when saving to database: ", error);
});

await sequelize.close();