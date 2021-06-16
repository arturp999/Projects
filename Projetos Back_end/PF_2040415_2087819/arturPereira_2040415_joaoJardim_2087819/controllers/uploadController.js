const Imges = require('../sequelize').Imges;

exports.oneImage = (req, res, next) => {
    if (!req.file) {
        const error = new Error('There is no file to upload')
        error.httpStatusCode = 400
        return next(error)
    } else {
        const userAtual = req.session.user.id
        Imges.create({
                img_original_name: req.file.originalname,
                img_filename: req.file.filename,
                img_location: req.file.path,
                user_img_id: userAtual
            })
            .then(img => {
                //var dirname = __dirname;
                //dirname.split('controllers');
                //var imgLocation = dirname.split('controllers')[0];
                //console.log(imgLocation)

                res.render('upload_sucess.ejs', {
                    locations: [img.img_filename]
                });
            })
    }
    //res.json("O ficheiro foi inserido com sucesso")
}

exports.multipleImage = (req, res, next) => {
    const files = req.files
    var img_locations = [];
    if (files == 0) {
        const error = new Error('There are no files to upload')
        error.httpStatusCode = 400
        return next(error)
    } else if (files > 10) {
        const errorF = new Error('Too many files to upload')
        errorF.httpStatusCode = 400
        return next(errorF)
    } else {
        const userAtual = req.session.user.id
        req.files.forEach(element => {
            Imges.create({
                img_original_name: element.originalname,
                img_filename: element.filename,
                img_location: element.path,
                user_img_id: userAtual
            })
            img_locations.push(element.filename)
                //console.log(element)
        });
        res.render('upload_sucess.ejs', {
            locations: img_locations
        });
    }
}