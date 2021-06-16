const Sequelize = require('sequelize');
const PersonModel = require('./models/uploader');
const ImageModel = require('./models/image');

const sequelize = new Sequelize(process.env.DB_SCHEMA, process.env.DB_USER, process.env.DB_PASS, {
    host: process.env.DB_HOST, // vai buscar a informação ao .env
    dialect: 'mysql', //engine da base de dados
    pool: {
        max: 10,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
});
const User = PersonModel(sequelize, Sequelize);
const Imges = ImageModel(sequelize, Sequelize)

// Adicionar o modelo à BD
sequelize.sync({ force: true })
    .then(() => {
        User.bulkCreate([ //criação dos dados para a base de dados
                { email: "admin@gmail.com", password: "admin" },
            ])
            .then(() => {
                return User.findAll();
            })
            .then((users) => {
                //console.log(users);
            });
    });

module.exports = {
    User,
    Imges
}