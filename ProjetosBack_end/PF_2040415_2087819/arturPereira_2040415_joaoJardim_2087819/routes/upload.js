var express = require('express');
var router = express.Router();
var uploadController = require('../controllers/uploadController.js');
var authenticateTokenFromSession = require('../Midlleware/verifyToken');
const multer = require('multer');

var storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, './public/images') //destination is used to determine within which folder the uploaded files should be stored.
    },
    filename: function(req, file, cb) {
        if (file.mimetype == "image/png" || file.mimetype == "image/jpg" || file.mimetype == "image/jpeg") {
            cb(null, Date.now() + '-' + file.originalname) //para evitar as img duplicarem o date sai em unix time
        } else {
            return cb(new Error('Only .png, .jpg and .jpeg format allowed!'));
        }
    },
})
var upload = multer({ storage: storage })

//upload de uma immagem
router.post('/uploadfile', authenticateTokenFromSession, upload.single('image'), uploadController.oneImage);

router.post('/uploadmultiple', authenticateTokenFromSession, upload.array('images', 10), uploadController.multipleImage);

router.get('/upload', authenticateTokenFromSession, function(req, res) {
    res.render('upload.ejs', {
        user: req.session.user
    });
});


module.exports = router;