var express = require("express");
var router = express.Router();
var User = require("../models/user");
var md5 = require("md5");
const { route } = require("./games");

// Get All
router.get("/", (req, res, next) => {
  User.find({}, (error, results, fields) => {
    if (error) {
      res.status(400).json("400- Bad Request");
    } else if (results.length == 0) {
      res.status(404).json("404- Not Found");
    } else {
      res.json(results);
    }
  });
});

// Crete 1
router.post("/", (req, res) => {
  User.findOne({}, {}, { sort: { _id: -1 } }, function (err, post) {
    var model = {
      _id: (post._id += 1),
      user: req.body.user,
      email: req.body.email,
      password: req.body.password,
    };
    User.insertMany(model);
    res.send("Criado com Sucesso");
  }).select({ _id: 1 });
});

// router.post("/login", (req,res)=> {
//   console.log(req.body);
//   User.find({ user: req.body.user, password:md5(req.body.password)}, (err, user) =>  {
//     if (err) {
//       res.status(400).json("400- Bad Request");
//     }  else {
//       res.status(200).send(user);
//     }})
// })

// Update 1 by ID
router.put("/:id", (req, res) => {
  User.findByIdAndUpdate(req.params.id, req.body, (error, result) => {
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
  User.findByIdAndDelete(id, (error, result, fields) => {
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