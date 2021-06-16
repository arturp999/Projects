var mongoose = require("mongoose");
var Schema = mongoose.Schema;

var gamesSchema = new Schema(
  {
    _id: {
      type: Number,
      required: true,
    },
    name: {
      type: String,
      required: true,
    },
    release_date: {
      type: Date,
      required: true,
    },
    stock: {
      type: Boolean,
      required: true,
    },
    game_type_id: {
      type: Array,
      required: true,
    },
    publisher_id: {
      type: Number,
      required: true,
    },
    developer_id: {
      type: Array,
      required: true,
    },
    img_url: {
      type: String,
      required: true,
    }
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

gamesSchema.virtual("Seller", {
  ref: "Seller",
  localField: "_id",
  foreignField: "games_id",
});

gamesSchema.virtual("Publisher", {
  ref: "Game_Publisher",
  localField: "publisher_id",
  foreignField: "_id",
});

gamesSchema.virtual("Developers", {
  ref: "Game_Developer",
  localField: "developer_id",
  foreignField: "_id",
});

gamesSchema.virtual("Type_of_Game", {
  ref: "Game_Type",
  localField: "game_type_id",
  foreignField: "_id",
});

var gameModel = mongoose.model("Game", gamesSchema, "games");

module.exports = gameModel;
