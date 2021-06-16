var mongoose = require('mongoose');
var connection = mongoose.connect('mongodb://localhost/PressPlay', {useNewUrlParser:true});

module.exports = connection;