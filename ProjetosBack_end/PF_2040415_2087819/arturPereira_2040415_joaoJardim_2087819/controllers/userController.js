const User = require('../sequelize').User;
var jwt = require('jsonwebtoken');

function generateAcessToken(email, password) {
    var token = jwt.sign({ email, password }, process.env.TOKEN_SECRET, { expiresIn: '1800s' });
    return token;
}

exports.logout = function(req, res) {
    //console.log(req.session)
    req.session.destroy();
    res.redirect('/')
}

exports.signup = function(req, res) {
    var { email } = req.body;
    var { password } = req.body;
    var pattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
    if (pattern.test(email)) {
        User.findOne({
            where: {
                email: email
            }
        }).then(result => {
            if (result == null) {
                if (req.body.password.length < 6) {
                    req.flash('signupMessage', 'Your password is too short you need at least 6 characters!');
                    res.redirect('/signup');
                } else if (password == email) {
                    req.flash('signupMessage', 'Your email cant be the same has your password!');
                    res.redirect('/signup');
                } else {
                    User.create({ 'email': email, 'password': password })
                        .then(user => {
                            req.session.user = user;
                            req.session.token = generateAcessToken(email, password);
                            res.redirect('/profile');
                        });
                }
            } else {
                req.flash('signupMessage', 'That e-mail is already taken.');
                res.redirect('/signup');
            }
        }).catch(function(err) {
            req.flash('signupMessage', err);
            res.redirect('/signup');
        });
    } else {
        req.flash('signupMessage', 'That format is not valid');
        res.redirect('/signup');
    }
}

exports.login = function(req, res) {
    var { email } = req.body;
    var { password } = req.body;
    var pattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
    if (pattern.test(email)) {
        User.findOne({
            where: {
                email: email
            }
        }).then(result => {
            if (result == null) {
                res.render('login.ejs', req.flash('loginMessage', 'Account does not exist'));
            } else if (password != result.password) {
                req.flash('loginMessage', 'Wrong password');
                res.redirect('/login');
            } else {
                req.session.user = result.dataValues;
                //console.log(generateAcessToken(email, password))
                req.session.token = generateAcessToken(email, password);
                res.redirect('/profile');
            }
        }).catch(err => {
            req.flash('loginMessage', err);
            res.redirect('/login');
        });
    } else {
        req.flash('loginMessage', 'That email is not valid');
        res.redirect('/login');
    };
}