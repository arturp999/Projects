var mongoose = require("mongoose");
var Schema = mongoose.Schema;
// var objectId = mongoose.Schema.ObjectId;

var game_publisherSchema = new Schema({
    _id: {
        type: Number,
        required: true
    }, name: {
        type: String,
        required: true
    }, country: {
        type: String,
        required: true
    }
}, {versionKey: false})

var game_publisherModel = mongoose.model('Game_Publisher', game_publisherSchema, 'game_publishers')

module.exports = game_publisherModel;