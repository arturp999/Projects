var dotenv = require('dotenv');
// read .env file
dotenv.config();

var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var app = express();

var flash = require('connect-flash'); //flash
var session = require('express-session');
app.use(flash());

const bodyParser = require('body-parser')
app.use(bodyParser.urlencoded({ extended: true }))

app.use(session({ secret: 'cat', cookie: { maxAge: 6000000 } })); //cria a cookie session com um limite

//rotas
var userRouter = require('./routes/user');
var usersRouter = require('./routes/uploader');
var uploadRouter = require('./routes/upload');
var catRouter = require('./routes/cat');

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use(express.static(path.join(__dirname, 'public')));

//definição de rotas
app.use('/', userRouter);
app.use('/uploader', usersRouter);
app.use('/upload', uploadRouter);
app.use('/cat', catRouter);

app.listen(3000, () => console.log('Server started on port 3000'));

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};
    // render the error page
    res.status(err.status || 500);
    res.render('error');
});

app.use(function(req, res) {
    // flash a message
    req.flash('info', 'hello!');
    next();
})


// var crypto = require('crypto');
// var tokenSecret = crypto.randomBytes(64).toString('hex');
// console.log(tokenSecret);

module.exports = app;