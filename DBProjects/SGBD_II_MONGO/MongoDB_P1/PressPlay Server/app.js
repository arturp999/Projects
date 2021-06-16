var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var cors = require('cors');

var connection = require("./config/db");

var indexRouter = require('./routes/index');
var game_developersRouter = require('./routes/game_developers');
var game_publishersRouter = require('./routes/game_publishers');
var game_typesRouter = require('./routes/game_types');
var userRouter = require('./routes/users')
var gamesRouter = require('./routes/games');
var sellerRouter = require('./routes/seller');

var app = express();
app.use(cors());// <- cors
// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/game_developers', game_developersRouter);
app.use('/game_publishers', game_publishersRouter);
app.use('/game_types', game_typesRouter);
app.use('/games', gamesRouter);
app.use('/users', userRouter);
app.use('/seller', sellerRouter);

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


module.exports = app;
