var jwt = require('jsonwebtoken');

module.exports = function(req, res, next) {
    const token = req.session.token;
    if (token == null) {
        //return res.sendStatus(401); 
        req.flash('loginMessage', 'You need to be logged in to acess that information!');
        res.redirect('/login'); //se nao tiver logado manda para a pagina de login
    } else {
        jwt.verify(token, process.env.TOKEN_SECRET, function(err, user) {
            if (err) {
                return res.sendStatus(403);
            }
            // TOKEN é valido e segue no layer
            next();
        });
    }
}