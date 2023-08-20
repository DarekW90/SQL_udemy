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

const UniversityStudent = sequelize.define("UniversityStudent", {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        validate: {
            isInt: true
        }
    },
    name:{
        type: DataTypes.STRING(24),
        allowNull: false,
        validate: {
            len: [3,24] // [min, max]
        }
    },
    email: {
        type: DataTypes.STRING(128),
        allowNull: false,
        unique: true,
        validate: {
            is: /.+\@.+\..+/, // wyrażenie regularne /.+(znaki) \@ (małpa) .+(znaki) \. (kropka) .+(znaki)
            len: 4 // minimum 4 znaki
        }
    },
    email2: {
        type: DataTypes.STRING(128),
        allowNull: true,
        unique: true,
        validate: {
            isEmail: { // automatycznie sequelize sprawdza czy to jest email
                msg: "email2 must be a valid email address"
            },
            len: [4, 128]
        }
    },
    age: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
            min: 18,
            max: 100,
            notNull: {
                msg: "age can't be null"
            }
        }
    },
    registerDate: {
        type: DataTypes.DATE,
        defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
        allowNull: true,
        validate: {
            isDate: true,
            isAfter: "2010-01-01", // czy data jest po: ....
            isBefore: "2055-01-01" // czy jest przed....
        }
    },
    employmentYearsExperience: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
            // walidacja własna
            customValidator(value) {
                if (value < 0) {
                    throw new Error("Employment experience must be above 0, can't be negative")
                }
            }
        }
    },
    companyName: {
        type: DataTypes.STRING(32),
        defaultValue: "Example Ltd.",
        allowNull: true,
        validate: {
            contains: "Ltd" // string musi zawierać tekst "Ltd"
        }
    },
    favColor: {
        type: DataTypes.STRING(12),
        defaultValue: "red",
        validate: {
            // isNull: true // wymaga Null
            isAlpha: true, // tylko litery
            //isAlphanumeric: true, // liczby oraz litery bez spacji, przecinka, podkreślenia
            //isInt: true,
            //isFloat: true,
            //isDecimal: true, // jaki kolwiek numer
            notEmpty: true, // nie może byc ""
            isLowercase: true, // małe litery
            //isUppercase: true, // duże litery
            isIn: [["red","green","blue","white","orange"]], // elementy dopuszczalne
            notIn: [["something","bad"]], //elementy niedopuszczalne
            notContains: "bar" // nie zawiera
        }
    },
    linkedIn: {
        type: DataTypes.STRING(128),
        allowNull: true,
        validate: {
            isUrl: true,
            //isCreditCard: true
        }
    }
});

await UniversityStudent.sync();

try {
    await UniversityStudent.create({
        name: "Ola",
        email: "ola.kowalska@gmail.com",
        email2: "ola.kowalska2@gmail.com",
        age: 29,
        registerDate: new Date(),
        employmentYearsExperience: 4,
        companyName: "Ola Company Ltd.",
        favColor: "green",
        linkedIn: "https://linkedin.com/ola.kowalska"
    });
} catch(err) {
    console.error(err);
}

await sequelize.close();