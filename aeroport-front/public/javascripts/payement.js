$(function(){
$('#payer').hide()
$('#insuffisant').hide()

//valider
$('#btnValider').click(function(){
  //var a: récupère la valeur du input
  var a = $('#username').val()
  //Fonction AJAX
  $.ajax({
    url: "/payer",
    method: "POST",
    data: 'recup=' + a
  }).done(function (data) { //récupère la valeur renvoyé (send) par la route /payer.
    //affiche le solde du compte dans la page.
    $('#solde').html("Solde du compte: " + data[0].montant + "€")
   //var som: contient seulement le nombre de la somme.
    var som = $('#somme').html().split(" ")
    //vat sol: contient seulement le nombre du solde.
    var sol = $('#solde').html().split(" ")
    //transforme le nombre de la somme en entier 
    var a = parseInt((som[3]))
    //transforme le nombre du solde en entier
    var b = parseInt((sol[3]))
    //condition: vérifie si le solde du compte est insuffisant, afin d'afficher l'alerte. 
    if(b < a){
      $('#insuffisant').show()
      $('#payer').hide()
      //sinon, si le solde est suffisant, le bouton payer s'affiche.
    }else {   
      $('#payer').show()
      $('#insuffisant').hide()
    }
  })
 })



  //payer
  $('#payer').click(function(){
    var som = $('#somme').html().split(" ") //permet de contenir seulement le nombre de la somme.
    var sol = $('#solde').html().split(" ") //permet de contenir seulement le nombre du solde.
    var a = parseInt((som[3])) //transforme le nombre de la somme en entier.
    var b = parseInt((sol[3])) //transforme le nombre du solde en entier.
    var c = b - a //retire le montant de la somme au solde de la carte.
   $('#solde_new').html("Solde du compte: "+c +"€") //affiche le nouveau solde dans la page modal.
var num = $('#username').val() //récupère la valeur du input (numéro de la carte)
   $.ajax({ //fonction AJAX
    url: "/solde",
    method: "POST",
    data: 'recup1=' + c + '&recup2=' + num //Envoie deux variable côté serveur: le nouveau solde et le numéro de la carte.
  })
})

})