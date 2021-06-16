var mongoose = require("mongoose");
var Schema = mongoose.Schema;
// var objectId = mongoose.Schema.ObjectId;

var game_typeSchema = new Schema({
    _id: {
        type: Number,
        required: true
    }, types: {
        type: String,
        required: true
    }
}, {versionKey: false})

var game_typeModel = mongoose.model('Game_Type', game_typeSchema, 'game_types')

module.exports = game_typeModel;