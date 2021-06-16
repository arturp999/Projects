var express = require('express');
var router = express.Router();
var authenticateTokenFromSession = require('../Midlleware/verifyToken');

var userController = require('../controllers/userController.js');

router.get('/', function(req, res, next) {
    res.render('index', { title: 'Express' });
});

router.post('/login', userController.login);
router.get('/login', function(req, res, next) {
    res.render('login.ejs', { message: req.flash('loginMessage') });
});

router.get('/logout', userController.logout);

router.post('/signup', userController.signup);
router.get('/signup', function(req, res, next) {
    res.render('signup.ejs', { message: req.flash('signupMessage') });
});

router.get('/profile', authenticateTokenFromSession, function(req, res) {
    res.render('profile.ejs', {
        user: req.session.user
    });
});

module.exports = router;