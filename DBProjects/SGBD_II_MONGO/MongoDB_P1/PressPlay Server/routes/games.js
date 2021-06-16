var express = require("express");
var router = express.Router();
var Game = require("../models/Game");
var Seller = require("../models/Seller");
var Game_Developer = require("../models/Game_Developer");

// Get All
router.get("/", (req, res, next) => {
  Game.find({}, (error, results, fields) => {
    if (error) {
      res.status(400).json("400- Bad Request");
    } else if (results.length == 0) {
      res.status(404).json("404- Not Found");
    } else {
      res.json(results);
    }
  });
});

router.get("/info/:id", (req, res, next) => {
  var id = req.params.id;
  Game.find({ _id: id }, (error, results, fields) => {
    res.json(results);
  })
    .populate("Seller")
    .populate("Publisher")
    .populate("Developers")
    .populate("Type_of_Game");
});


router.get("/devs/:id", (req, res, next) => {
  var id = req.params.id;
  Game.find({ _id: id }, (error, results, fields) => {
    res.json(results);
  })
    .populate("Developers")
});

router.get("/type/:id", (req, res, next) => {
  var id = req.params.id;
  Game.find({ _id: id }, (error, results, fields) => {
    res.json(results);
  })
    .populate("Type_of_Game")
});

router.get("/infoSeller/:id", (req, res, next) => {
  var id = req.params.id;
  Seller.find({ games_id: id }, (error, results, fields) => {
    res.json(results);
  }).populate("User_Game");
});


router.get("/teste", (req, res, next) => {
  //diz os vendedores de 1 jogo
  Game.findOne({}, function (err, data) {
    if (err) {
      res.status(500).json(err);
    } else {
      res.json(data);
    }
  }).populate("Seller");
});

// get
// router.get('/teste', (req, res, next) => {
//     Seller.aggregate([
//         {
//         $lookup:{
//             from:"games",
//             localField:"games_id",
//             foreignField:"_id",
//             as: "CurrentlySelling"}
//         },
//         {$match:{"seller_id":1}}]).exec(function (err,results) {
//             if (err) {
//                 res.status(400).json("400- Bad Request");
//             }  else {
//                 res.json(results);
//             }
//         });
// })

router.post("/", (req, res) => {
  Game.findOne({}, {}, { sort: { _id: -1 } }, function (err, post) {
    var model = {
      _id: (post._id += 1),
      name: req.body.name,
      stock: req.body.stock,
      game_type_id: req.body.game_type_id,
      publisher_id: req.body.publisher_id,
      developer_id: req.body.developer_id,
      img_url: req.body.img_url,
      release_date: new Date(req.body.release_date),
    };
    // console.log(model);
    Game.insertMany(model);
    // res.send("Criado com Sucesso");
  }).select({ _id: 1 });
});


// Update 1 by ID
router.put("/:id", (req, res) => {
  Game.findByIdAndUpdate(req.params.id, req.body, (error, result) => {
    console.log(req.body);
    if (error) {
      res.status(400).json("400- Bad Request");
    } else if (result == null) {
      res.status(404).send("ID inexistente");
    } else {
      res.send("Atualizado com sucesso");
    }
  });
});

// Delete 1 by ID
router.delete("/del/:id", (req, res) => {
  var id = req.params.id;
  Game.findByIdAndDelete(id, (error, result, fields) => {
    if (error) {
      res.status(400).json("400- Bad Request");
    } else if (result == null) {
      res.status(404).send("ID inexistente");
    } else {
      res.json("Deleted");
    }
  });
});

module.exports = router;
