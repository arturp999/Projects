var mongoose = require("mongoose");
var Schema = mongoose.Schema;
objectId = mongoose.Schema.ObjectId;

var usersSchema = new Schema(
  {
    _id: {
      type: Number,
      // type: objectId,
      // auto: true,
    },
    user: {
      type: String,
      required: true,
    },
    email: {
      type: String,
      required: true,
    },
    password: {
      type: String,
      required: true,
    },
  },
  { versionKey: false }
);

var userModel = mongoose.model("User", usersSchema, "users");

module.exports = userModel;
