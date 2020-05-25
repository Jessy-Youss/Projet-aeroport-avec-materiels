$(function(){

  $('#BTN_PAYER_VOYAGEUR').hide()
        var bag = 1;
        var somme = 0;
        //retire le "nombre de bagage" et garde que le chiffre a l'aide la fonction split()
        let nbr = $('#nbre_bag').html().split(": ")

        //Bouton enregristrement: Débloque le bouton suivant et se bloque
        $('#BTN_ENREGISTREMENT_VOYAGEUR').click(function(){
          //afin de récupérer seulement le poids
          var coupeBalance =  $('#val').html().split(" ")
          //Condition qui permet d'enregistrer une seul fois le bagage
          if ($('#BTN_ENREGISTREMENT_VOYAGEUR').attr('class') === "btn btn-primary"){
          if( coupeBalance[0] > 10){somme = somme + 10}
          if(bag == nbr[1]){
            $('#BTN_SUIVANT_VOYAGEUR').hide()
            $('#BTN_PAYER_VOYAGEUR').show()
           }
          }

          if ( $('#BTN_ENREGISTREMENT_VOYAGEUR').attr('class') === "btn btn-primary"){
          $('#BTN_ENREGISTREMENT_VOYAGEUR').attr('class','btn btn-primary disabled')
          $('#BTN_SUIVANT_VOYAGEUR').attr('class','btn btn-primary')
        }else { alert('bagage deja enregistrer')}
          
        })
    
       //Bouton suivant: Débloque le bouton enregistrement et se bloque et change le numéro de bagage
        $('#BTN_SUIVANT_VOYAGEUR').click(function(){
             if ( $('#BTN_SUIVANT_VOYAGEUR').attr('class') === "btn btn-primary"){
                 bag = bag+1 
                 $('#exampleModalLongTitle_Voyageur').html("Bagage "+ bag)
                 $('#BTN_ENREGISTREMENT_VOYAGEUR').attr('class','btn btn-primary')
                 $('#BTN_SUIVANT_VOYAGEUR').attr('class','btn btn-primary disabled')
                 }
              
                })

       //Bouton payer
       $('#BTN_PAYER_VOYAGEUR').click(function(){
       location.href = "/payement?prix="+somme
       })

})
    
    
    
    
    