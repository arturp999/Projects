const express = require('express')
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express()
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
const port = 3000

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'projectbackend'
});

app.get('/', (req, res) => res.send('Lets get started'));
app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`));

// PARTE A
// Listar todos os vídeos
app.get('/videos', (req, res) => {
    var sql = "SELECT * FROM videos"; //Seleciona todos os videos

    connection.query(sql, (error, results, fields) => {
        if (error) {
            res.status(400).json(error); // Requisição inválida
        } else if (results.length == 0) {
            res.status(404).json("Sem resultados"); //Não encontrado
        } else {
            res.json(results);
        }
    });
});

// Adcionar um novo vídeo
app.post('/video', (req, res) => {
    if (!req.body || !req.body.uploader || !req.body.title || !req.body.description || !req.body.duration ||
        !req.body.url || !req.body.views || !req.body.likes || !req.body.dislikes || !req.body.comments || !req.body.tags) {
        res.status(400).send("Falta dados"); // ele manda o erro 400 e a mensagem que descrevemos//confirma se ta tudo prenchido
    } else {
        var sql = "INSERT INTO videos (uploader, title, description, duration, url, views, likes, dislikes, comments, tags) VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ?)";
        connection.query(sql, [req.body.uploader, req.body.title, req.body.description, req.body.duration, req.body.url, req.body.views, req.body.likes, req.body.dislikes, JSON.stringify(req.body.comments), JSON.stringify(req.body.tags)], //é preciso o stringify para inserir JSON converte valores em javascript para uma String  JSON
            (error, results, fields) => {
                if (error) {
                    res.status(400).json(error);
                } else if (results.insertId == 0) {
                    res.status(400).json("Erro ao inserir");
                }
                res.json(results.insertId);
            });
    }
});

// Selecionar todos os vídeos de um uploader
app.get('/video/uploader', (req, res) => {
    if (!req.body.uploader) {
        res.status(400).send("Falta o nome do uploader");
    } else {
        var uploader = req.body.uploader;
        var sql = "SELECT * FROM videos WHERE uploader = ?";
        connection.query(sql, [uploader], (error, results, fields) => {
            if (error) {
                res.json(error);
            } else if (Object.keys(results).length == 0) { //transforma o objeto num array(.Object)
                res.status(404).send("Uploader não têm videos");
            } else {
                res.json(results);
            }
        });
    }
});

// Incrementar número de likes
app.put('/video/like/:id', (req, res) => { //por parametro
    if (!req.params.id) {
        res.status(400).send("Esse ID não existe.");
    } else {
        var sql = "UPDATE videos SET likes = likes +1 WHERE id =" + req.params.id;
        connection.query(sql, (error, results, fields) => {
            if (error) {
                res.json(error);
            } else if (results.affectedRows == 0) {
                res.status(404).send("Esse ID não existe.");
            } else {
                var sql = "SELECT * FROM videos WHERE id =" + req.params.id;
                connection.query(sql, (error, results, fields) => {
                    if (error) {
                        res.json(error);
                    } else {
                        res.json(results[0].likes);
                    }
                });
            }
        });
    }
});

// Listar todos os vídeos com determinadas tags
app.get('/videos/tag', (req, res) => {
    if (!req.body.tags || req.body.tags.length == 0) {
        res.status(400).send("Sem tags");
    } else {
        var sql = "SELECT * FROM videos";

        connection.query(sql, (error, results, fields) => {
            if (error) {
                res.json(error);
            }
            results.forEach(element => {
                element.tags = JSON.parse(element.tags); //transforma em array
            });
            var videosTags = [];
            results.forEach(element => { //corre todos os resultados da query
                element.tags.forEach(elementTag => { //corre o array tags de cada elemento dos resultados
                    req.body.tags.forEach(tag => { //corre as tags recebidas do body
                        if (elementTag == tag) { //compara os dois
                            videosTags.push(element); //adiciona ao array de cima caso a tag exista dentro do array de tags do result
                        }
                    });
                });
            });

            if (videosTags.length == 0) {
                res.status(404).send("Sem resultados");
            } else {
                res.json(videosTags);
            }
        });
    }
});


// PARTE B
// Selecionar vídeo pelo ID
app.get('/video/:id', (req, res) => {
    if (!req.params.id) {
        res.status(400).send("Sem id");
    } else {
        var sql = "SELECT * FROM videos WHERE id =" + req.params.id;
        connection.query(sql, (error, results, fields) => {
            if (error) {
                res.json(error);
            } else if (Object.keys(results).length == 0) {
                res.status(404).send("Video nao encontrado");
            } else {
                res.json(results[0]);
            }
        });
    }
});

// Apagar um video
app.delete('/videos/:id', (req, res) => {
    if (!req.params.id) {
        res.status(400).send("Sem id");
    } else {
        var sql = "DELETE FROM videos WHERE id =" + req.params.id;
        connection.query(sql, (error, results, fields) => {
            if (error) {
                res.json(error);
            } else if (results.affectedRows == 0) {
                res.status(404).send("ID inexistente");
            } else {
                res.json("Vídeo de ID:" + req.params.id + " apagada");
            }
        });
    }
});

// Incrementar número de dislikes
app.put('/video/dislike/:id', (req, res) => { //por parametro
    if (!req.params.id) {
        res.status(400).send("Esse ID não existe.");
    } else {
        var sql = "UPDATE videos SET dislikes = dislikes +1 WHERE id =" + req.params.id;
        connection.query(sql, (error, results, fields) => {
            if (error) {
                res.json(error);
            } else if (results.affectedRows == 0) {
                res.status(404).send("Esse ID não existe.");
            } else {
                var sql = "SELECT * FROM videos WHERE id =" + req.params.id;
                connection.query(sql, (error, results, fields) => {
                    if (error) {
                        res.json(error);
                    } else {
                        res.json(results[0].dislikes);
                    }
                });
            }
        });
    }
});

// Adcionar comentarios 
app.put('/video/comments/:id', (req, res) => {
    if (!req.params.id || !req.body.comments || req.body.comments.length == 0) {
        res.status(400).send("Faltam dados");
    } else {
        var sql = "SELECT * FROM videos WHERE id =" + req.params.id;

        connection.query(sql, (error, results, fields) => {
            if (error) {
                res.json(error);
            } else {
                results[0].comments = JSON.parse(results[0].comments);
                req.body.comments.forEach(element => {
                    results[0].comments.push(element)
                });
                var retornar = results[0];
                var sql = "UPDATE videos SET comments = ? WHERE id=" + req.params.id;
                connection.query(sql, [JSON.stringify(results[0].comments)], (error, results, fields) => {
                    if (error) {
                        res.json(error);
                    } else {
                        res.json(retornar);
                    }
                });
            }
        });
    }
});

// Apresentar todos os videos ordenados pela quantidade de likes
app.get('/videos/order/desc', (req, res) => {
    var sql = "SELECT * FROM videos ORDER BY likes DESC";

    connection.query(sql, (error, results, fields) => {
        if (error) {
            res.status(400).json(error);
        } else if (results.length == 0) {
            res.status(404).json("Sem resultados");
        } else {
            res.json(results);
        }
    });
});