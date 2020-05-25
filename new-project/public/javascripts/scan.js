
$(function(){
  $('#num').click(function(){
    setTimeout(()=>{
      $('#txt').val(789)
    }
       ,2000
    )
   
  })

//cache les boutons
$('#FOOTER_IDENTIFICATION_REESAYER').hide();
$('#FOOTER_IDENTIFICATION_SUIVANT').hide();


//Réesayer à loading
$('#BTN_IDENTIFICATION2').click(function(){
$('#FOOTER_IDENTIFICATION_REESAYER').hide()
$('#FOOTER_IDENTIFICATION_LOADING').show();
//vide le input
$('#txt').val("")

setTimeout(()=>{
  $('#txt').val(123)
}
   ,2000
)
});

//btn suivant
$('#BTN_IDENTIFICATION3').click(function(){
 //let a: récupère la valeur du input.
 let a = $('#txt').val()
 //fonction AJAX
 $.ajax({
  url: "/recup",
  method: "POST",
  data: 'recup=' + a
}).done(function (data) { 
//redirection vers la page suivante (identification) en attribuant le paramètre Id à l'URL qui a pour valeur le numéro de billet 
 location.href ="/identification?Id="+ data[0].numero_billet
})
});

//btn valider
$('#btn').click(function(){
  //let a: récupère la valeur du input.
  let a = $('#txt').val()
  //Fonction ajax
    $.ajax({
    url: "/recup",//route visé.
    method: "POST",//choix de la méthode.
    data: 'recup=' + a //variable recup: prend la valeur de la variable a (valeur du input) pour être exploité côté serveur.
  }).done(function (data) { //.done: récupère la valeur envoyé par le serveur pour ensuite l'exploiter.
    //Si le data est vide, alors le bouton Réessayer s'affiche (show()) et les deux autres se cachent (hide()).
    if (data ==""){
      $('#FOOTER_IDENTIFICATION_LOADING').hide();
      $('#FOOTER_IDENTIFICATION_REESAYER').show();
      $('#FOOTER_IDENTIFICATION_SUIVANT').hide()
     //Sinon si le data contient des données, alors le bouton Suivant s'affiche et les deux autres se cachent
    } else{
      $('#FOOTER_IDENTIFICATION_SUIVANT').show()
      $('#FOOTER_IDENTIFICATION_LOADING').hide();
      $('#FOOTER_IDENTIFICATION_REESAYER').hide();
    }
  })
  })


});



   
