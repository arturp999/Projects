const Imges = require('../sequelize').Imges;
const fs = require('fs');

//mostra todas as imagens que o user têm
exports.allImages = (req, res) => {
    const userAtual = req.session.user.id
    var img_locations = [];
    Imges.findAll({
            where: {
                user_img_id: userAtual,
            }
        })
        .then(img => {
            if (img.length == 0) {
                res.json("User currently has no images");
            } else {
                //   console.log(img)
                img.forEach(element => {
                    img_locations.push(element.img_filename)
                });
                //console.log(img_locations);
                res.render('images.ejs', {
                    locations: img_locations
                });
            }
        })
}


//procura por ID em todos e da delete nele pelo id
exports.catDelete = (req, res) => {
    const id = req.params.id;
    Imges.findOne({
            where: { id: id }
        })
        .then(image => {
            if (image == null) {
                res.status(400).send("Gato não existe ou já foi apagado.") //400 Bad Request 
            } else {
                var delLocation = image.img_location;
                Imges.destroy({ where: { id: id } })
                    .then(image => {
                        res.json("Rows Deleted: " + image);
                    });
                fs.unlinkSync(delLocation),
                    (err) => {
                        if (err) throw err;
                        console.log('successfully deleted');
                    }
            }
        });
}


//elimina todos as imagens que o user têm guardado
exports.catDeleteAll = (req, res) => {
    const userAtual = req.session.user.id;
    var rowDeleted = 0;
    Imges.findAll({
            where: { user_img_id: req.session.user.id }
        })
        .then(images => {
            // console.log(images)
            rowDeleted = images.length;
            if (images == null || images.length == 0) {
                res.status(400).send("Não têm gatos ou já foram apagados") //400 Bad Request 
            } else {
                images.forEach(element => {
                    fs.unlinkSync(element.img_location),
                        (err) => {
                            if (err) throw err;
                        }
                    Imges.destroy({ where: { id: element.id } })
                });

            }
            res.json("Rows deleted: " + rowDeleted);
        });
}