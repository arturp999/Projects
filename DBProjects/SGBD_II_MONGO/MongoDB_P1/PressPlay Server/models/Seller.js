var mongoose = require("mongoose");

var Schema = mongoose.Schema;
var objectId = mongoose.Schema.ObjectId;

var sellerSchema = new Schema(
  {
    _id: {
      type: objectId,
      auto: true,
    },
    seller_id: {
      type: Number,
      required: true,
    },
    quantity: {
      type: Number,
      required: true,
    },
    price: {
      type: Number,
      required: true,
    },
    games_id: {
      type: Number,
      required: true,
    },
  },
  {
    versionKey: false,
    toObject: {
      virtuals: true,
    },
    toJSON: {
      virtuals: true,
    },
  }
);

sellerSchema.virtual("Selling_game_id", {
  ref: "Game",
  localField: "games_id",
  foreignField: "_id",
});

sellerSchema.virtual("User_Game", {
  ref: "User",
  localField: "seller_id",
  foreignField: "_id",
});

var sellerModel = mongoose.model("Seller", sellerSchema, "seller");

module.exports = sellerModel;
