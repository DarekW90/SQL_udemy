/*
    Sequelize - CRUD; find ()
    Create
    Read
    Update
    Delete
*/

import {DataTypes, Sequelize, Op} from "sequelize";

const sequelize = new Sequelize("test","root","", {
    host:"localhost",
    dialect: "mysql",
    decimalNumbers: true
});

const colorsArr = ["light","dark","silver","blue","red"];

sequelize.authenticate().then(() => {
    console.log('Connection has been established successfully.');
}).catch((error) => {
    console.error('Unable to connect to the database: ', error);
});

const WebShopCustomer = sequelize.define("WebShopCustomer", {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        validate: {
            isInt: true
        }
    },
    name: {
        type: DataTypes.STRING(16),
        allowNull: false,
        validate: {
            len: [1,16]
        }
    },
    surname: {
        type: DataTypes.STRING(16),
        allowNull: false,
        validate: {
            len: [1,32]
        }
    },
    email: {
        type: DataTypes.STRING(128),
        allowNull: false,
        unique: true,
        validate: {
            isEmail: true,
            len: [5,128]
        }
    },
    shopPoints: {
        comment: "Points earned in the web shop",
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
            min: 0,
            max: 100000,
            notNull: {
                msg: "Points can't be null"
            },
            notBelowZero(value) {
                if (value < 0 ) {
                    throw new Error("Points can't be negative")
                }
            }
        }
    },
    age: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
            min: 18,
            max: 100,
            notNull: {
                mgs: "Age can't be null"
            }
        }
    },
    registerDate: {
        type: DataTypes.DATE,
        defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
        allowNull: true,
        validate: {
            isDate: true,
            isAfter: "2010-01-01",
            isBefore: "2055-01-01"
        }
    },
    themeColor: {
        type: DataTypes.STRING(12),
        defaultValue: "light",
        validate: {
            isAlpha: true,
            notEmpty: true,
            isLowercase: true,
            isIn: [colorsArr]
        }
    }
});

await WebShopCustomer.sync({alter:true});


function logCustomer(c) {
    console.log(c.id,c.name,c.surname,c.email,c.shopPoints,c.age,c.registerDate,c.themeColor);
}

try {

    console.log("\nCustomers with blue theme and name 'Daria' ");
    const customersLightTheme = await WebShopCustomer.findAll({
        where: {
            themeColor: "blue",
            name: "Daria"
        },

        // ograniczanie wyników

        offset: 0, //przesunięcie wyników o ...
        limit: 2
    });

    customersLightTheme.forEach(c => logCustomer(c.dataValues));

    console.log("\nCustomers with blue theme and id > 3");
    const customers2 = await WebShopCustomer.findAll({
        where: {
            themeColor: {
                [Op.eq]:"blue"
            },
            id: {
                [Op.gte]:3 // greater equal
            }
        },

    });

    customers2.forEach(c => logCustomer(c.dataValues));



    console.log("\nCustomers with r,g,b,l theme and id >= 5");
    const customers3 = await WebShopCustomer.findAll({
        where: {
            // and - każdy z tych warunków musi zostać spełniony
            [Op.and]: [
                { id: {[Op.gte]:5 } }, // id >= 5
                { name: "Kasia"},
                {themeColor: ["red","green","blue","light"]} // jeden z tych
            ]
        }
    });

    customers3.forEach(c => logCustomer(c.dataValues));




    console.log("\nCustomers with r,g,b,l theme and id >= 5");
    const customers4 = await WebShopCustomer.findAll({
        where: {
            // or - jeden z tych warunków musi zostać spełniony
            [Op.or]: [
                { id: {[Op.lte]:10 } }, // id <= 10
                { shopPoints: {[Op.between]:[1,98]}},
                { shopPoints: {[Op.notBetween]:[100,1000]}},
                { themeColor: {[Op.in]:["light","red","dark"]}},
                { themeColor: {[Op.notIn]:["green","blue","yellow"]}},
                { name: {[Op.like]: "A%"}}, //prefix ma być "A%"
                { name: {[Op.notLike]: "A%"}}, //prefix nie ma być "A%"
                { name: {[Op.startsWith]: "A%"}}, //ma zaczynać się od "A"
                { name: {[Op.endsWith]: "ia"}}, //ma kończyć się na "ia"
                { name: {[Op.substring]: "ol"}}, //ma zawierać w środku " ol " => LIKE %ol%
                { id: {[Op.eq]:12}}, // id = 12
                { id: {[Op.ne]:12}}, // id != 12
                { themeColor: {[Op.is]: null}},
                { themeColor: {[Op.not]: null}},
            ]
        }
    });

    customers4.forEach(c => logCustomer(c.dataValues));


    // wyszukaj klienta z id 22
    const customerByPK = await WebShopCustomer.findByPk(22);
    console.log("Customer with id: 22", customerByPK.dataValues);

    // findOne
    const customerKasia = await WebShopCustomer.findOne({
        where: {
            name:"Kasia"
        }
    });
    console.log("Kasia:", customerKasia.dataValues);

    // sprawdzi czy istnieje, jeśli nie to uwtorzy i pokaże, że istnieje

    const dataDb = await WebShopCustomer.findOrCreate({
        where: { name:"QWERTY!"},
        defaults: {
            surname: "Kowalski",
            email: "qwerty@gmail.com",
            shopPoints: 100,
            age: 99,
            registerDate: new Date(),
            themeColor: "light"
        }
    });
    console.log("dataDb", dataDb);

    // znajdz i policz wszystkie


    const dataDb2 = await WebShopCustomer.findAndCountAll({
        where: {
            name: {
                [Op.like]: "Ol%"
            }
        }
    });

    console.log("rows:", dataDb2.rows);
    console.log("rows.count:", dataDb2.count);






} catch(err) {
    console.log(err);
}

await sequelize.close();