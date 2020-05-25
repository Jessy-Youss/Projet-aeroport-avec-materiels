var express = require('express');
var router = express.Router()
var url = require('url');
const SerialPort = require('serialport');
const Readline = require('@serialport/parser-readline');
const port = new SerialPort('COM24', { baudRate: 9600 });
const parser = port.pipe(new Readline({ delimiter: '\n' }));

var mysql = require ('../public/javascripts/BDD')

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index');
});

//Balance
router.get('/balance', function(req, res, next) {
  parser.on('data', (data) => {
  //Fonction split(): divise une chaîne de caractère à partir d'un séparateur pour fournir un tableau de sous chaîne.
  let decoupe = data.split(":");
  //decoupe[0]: Retire tout ce qu'il y'a après le séparateur ":" /conserve seulement "Tare","Net" et "Gross".
  //decoupe[1]: Retire tout ce qu'il y'a avant le séparateur ":" /conserve seulement le poid du Tare, Net et Gross +"kg".
  let decoupe2 = decoupe[1].split(" ")
  //decoupe2[0]: Retire tout ce qu'il y'a après le séparateur " " /conserve seulement le poids en retirant le "kg".
  //decoupe2[0]:Contient le "kg".
  //Condition: Si decoupe[0] est égale à Net, alors on affiche seulement le decoupe2[0] du Net, et non les 2 autres. 
  if (decoupe[0] === "Net"  ){
    res.send(decoupe2[0])
  }
 });
});


//page identification
router.get('/identification', function(req, res, next) {
  //var pathname: contient le query string de l'URL (numéro du billet)
  var pathname = url.parse(req.url, true).query;
  //requete SQL: Sélectionne toutes les données (table utilisateur) du voyageur et le nombre de bagage en soute.
    mysql.query('SELECT utilisateur.nom,utilisateur.prenom, utilisateur.sexe, utilisateur.date_de_naissance, utilisateur.adresse_mail,utilisateur.adresse,utilisateur.telephone, billet.numero_billet, bagage_soute.nombre_bagage from utilisateur,billet, bagage_soute,reservation_vol WHERE  reservation_vol.Id_utlisateur = utilisateur.id_client AND billet.numero_billet = ' + pathname.Id ,(req, row)=>{	
     //renvoie au client la vue identification.ejs + la variable row qui contient le résultat de la requête SQL (format JSON) 
      res.render('identification', { row :row});
			console.log(row)			
	});
});

//Verification numero billet
router.post('/recup',function(req,res,next){
  //var a: récupère la valeur de la variable recup, envoyé à partir de AJAX.
  var a = req.body.recup;
  //requête SQL: sélectionne toutes les données (table billet) du voyageur qui a pour numéro de billet, la valeur du input.
  mysql.query('SELECT * FROM billet WHERE numero_billet = ' + a,(req, row)=>{
    //envoie le résultat de la requête vers le client, récupéré par AJAX à l'aide de la fonction done().
     res.send(row)
     console.log(row)
     }) 
})


//payement
router.get('/payement', function(req, res, next) {
  //var pathname: contient le query string de l'URL (montant de la somme)
  var pathname = url.parse(req.url, true).query;
  // //renvoie au client la vue payement.ejs + la variable prix (soit le montant de la somme)
   res.render('payement',{prix : pathname.prix})
 }) 


//Envoie les données de la carte
router.post('/payer',function(req,res,next){
  //var a: récupère la valeur de la variable recup (numéro de la carte), envoyé à partir de AJAX.
  var a = req.body.recup;
  //requête SQL: sélectionne toutes les données de la table carte_payement, qui a pour numéro de carte la valeur du input.
  mysql.query('SELECT * FROM carte_payement WHERE numero_carte = ' + a,(req, row)=>{
    //envoie le résultat de la requête (données) vers le côté client.
     res.send(row)
       }) 
    })


//insere le nouveau solde
router.post('/solde',function(req,res,next){
  //récupère la variable recup1 (le nouveau solde), envoyé à partir d'AJAX.
  var solde = req.body.recup1; 
  //récupère la variable recup2 (le numéro de la carte), envoyé à partir d'AJAX.
  var num_compte = req.body.recup2; 
 //requête SQL: modifie le solde du compte qui a pour numéro de compte la valeur du input, par le nouveau solde.
  mysql.query('UPDATE carte_payement SET montant =' + solde + ' WHERE numero_carte = ' + num_compte,(req, row)=>{     
     }) 

})


module.exports = router;


