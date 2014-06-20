$(document).ready(function(){
  console.log("voacab loaded bro!");

  for(i=0; i < window.cards.length; i++){
    $('#word_' + window.cards[i]).flip();
  }


});
