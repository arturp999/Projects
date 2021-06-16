var express = require('express');
var router = express.Router();
var authenticateTokenFromSession = require('../Midlleware/verifyToken');

var catController = require('../controllers/catController.js');

router.get('/images', authenticateTokenFromSession, catController.allImages);

router.delete('/catDelete/:id', authenticateTokenFromSession, catController.catDelete);

router.delete('/catDeleteAll', authenticateTokenFromSession, catController.catDeleteAll);

module.exports = router;