var express = require('express');
var authenticateTokenFromSession = require('../Midlleware/verifyToken'); //vai buscar a função para validar o token
var router = express.Router();

var uploaderController = require('../controllers/uploaderController.js');

/* CRUD */
/* todos os users */
router.get('/alluploaders', authenticateTokenFromSession, uploaderController.alluploaders);

/* inserir um novo user */
router.post('/postUploader', authenticateTokenFromSession, uploaderController.postUploader);

/* dar delete de  um user por id/params */
router.delete('/uploaderDelete/:id', authenticateTokenFromSession, uploaderController.uploaderDelete);

/* buscar um user por ID/params */
router.get('/uploaderId/:id', authenticateTokenFromSession, uploaderController.uploaderId);

/* da update a um user por ID/params */
router.put('/uploaderPut/:id', authenticateTokenFromSession, uploaderController.uploaderPut);



module.exports = router;