const User = require('../sequelize').User;

// /* apresentar todos os users */
// https://sequelize.org/v5/manual/querying.html <-
exports.alluploaders = (req, res) => {
    User.findAll()
        .then(users => {
            res.json(users) //("All users:", JSON.stringify(users, null, 4));
        });
}

//insere um novo user introduzindo pelo postman {"email" : "jaunnn@lul.com","password" : "jaunnn"}
exports.postUploader = (req, res) => {
    if (JSON.stringify(req.body) == "{}") {
        res.status(400).send("Nao tem informação no body")
    } else {
        newEmail = req.body.email;
        newPw = req.body.password;
        User.findOne({
                where: { email: newEmail }
            })
            .then(user => {
                if (!newEmail || !newPw) {
                    res.status(400).send("Falta dados");
                } else if (user == null) {
                    User.create({
                            email: newEmail,
                            password: newPw
                        })
                        .then(newUser => {
                            //res.json("Welcome: " + newUser.email + ", your password is: " + newUser.password);
                            res.json(newUser)
                        });
                } else {
                    res.status(401).send("Utilizador já existe");
                }
            });
    }

}

//procura por ID em todos e da delete nele pelo id
exports.uploaderDelete = (req, res) => {
    const id = req.params.id;
    User.findOne({
            where: { id: id }
        })
        .then(user => {
            if (user == null) {
                res.status(400).send("User não existe ou já foi apagado.") //400 Bad Request 
            } else {
                User.destroy({ where: { id: id } })
                    .then(user => {
                        res.json("Rows Deleted: " + user);
                    });
            }
        });
}

//procura por ID em todos
exports.uploaderId = (req, res) => {
    const id = req.params.id;
    User.findAll({
            where: { id: id }
        })
        .then(user => {
            if (user.length == 0) {
                res.status(400).send("User não existe ou já foi apagado.") //400 Bad Request 
            } else {
                res.json(user);
            }
        });
}

//atualizada por ID
exports.uploaderPut = (req, res) => {
    const id = req.params.id;
    const newPw = req.body.password; // inserir pelo body no postman
    User.findOne({
            where: { id: id }
        })
        .then(atualiza => {
            if (atualiza == null) {
                res.status(400).send("User não existe ou já foi apagado.") //400 Bad Request 
            } else {
                //console.log(update.password)
                atualiza.update({
                        password: newPw // inserir pelo body no postman -> {"password" : "jaunnn"}
                    })
                    .then(pw => {
                        res.json("Password is: " + pw.password);
                    });
            }
        })
}