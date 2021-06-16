var mongoose = require("mongoose");
var Schema = mongoose.Schema;
// var objectId = mongoose.Schema.ObjectId;

var game_developerSchema = new Schema({
    _id: {
        type: Number,
        required: true
    }, name: {
        type: String,
        required: true
    }
}, {versionKey: false})

var Game_Developer_Model = mongoose.model('Game_Developer', game_developerSchema, 'game_developers')

module.exports = Game_Developer_Model;