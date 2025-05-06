const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

// Middleware pour parser le body des requêtes en JSON
app.use(bodyParser.json());

// Configuration de la connexion à MySQL
const db = mysql.createConnection({
  host: '10.50.0.20', // Remplacez par l'IP de votre serveur MySQL
  user: 'stan',         // Nom d'utilisateur de la base de données
  password: 'stan',     // Mot de passe de la base de données
  database: 'avventura' // Nom de la base de données
});

// Connexion à MySQL
db.connect((err) => {
  if (err) {
    console.error('Erreur de connexion à MySQL:', err);
    return;
  }
  console.log('Connecté à la base de données MySQL');
});

// Endpoint pour récupérer toutes les nations
/*app.get('/nation', (req, res) => {
  const sql = 'SELECT * FROM nation';
  db.query(sql, (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json(results);
  });
});

// Endpoint pour ajouter une nouvelle nation
app.post('/nation', (req, res) => {
  const { nom, continent } = req.body;
  const sql = 'INSERT INTO nation (nom, continent) VALUES (?, ?)';
  db.query(sql, [nom, continent], (err, result) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json({ id: result.insertId, nom, continent });
  });
});*/

// Démarrage du serveur
app.listen(port, () => {
  console.log(`Serveur API en écoute sur http://localhost:${port}`);
});