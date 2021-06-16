var express = require('express');
var router = express.Router();
var game_type = require('../models/game_type');

// Get All
router.get('/', (req, res, next) => {
    game_type.find({},(error, results, fields) => {
        if (error) {
            res.status(400).json("400- Bad Request");
        } else if (results.length == 0) {
            res.status(404).json("404- Not Found");
        } else {
            res.json(results);
        }
    })
});

// Crete 1
router.post('/', (req, res)=>{
    var model = new game_type(req.body);

    model.save((error, results, fields) => {
        if(error){
            res.status(400).json("400- Bad Request");
        } else {
            res.send("Criado com Sucesso");
        }
    })
})

// Update 1 by ID
router.put('/:id',(req, res) =>{
    game_type.findByIdAndUpdate(req.params.id, req.body, (error, result)=>{
        if(error) {
            res.status(400).json("400- Bad Request");
        } else if(result == null){
            res.status(404).send("ID inexistente");
        } else {
            res.send("Atualizado com sucesso");
        }
    })
})

// Delete 1 by ID
router.delete('/del/:id',(req, res) =>{
    var id = req.params.id;

    game_type.findByIdAndDelete(id,(error, result, fields)=>{
        if (error) {
            res.status(400).json("400- Bad Request");
        } else if (result == null) {
            res.status(404).send("ID inexistente");
        } else {
            res.json("Deleted");
        }
    })
})

module.exports = router;
