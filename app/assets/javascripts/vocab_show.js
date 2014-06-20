$(document).ready(function(){
  console.log("voacab loaded bro!");

  // $('.wrap-wrap').each(function(i, v) {
  //   $(v).flip();
  // });

  // $('.card-wrap').each(function(index, value) {
  //   if ($(value).data('flipped') === true){
  //     $(this).flipOn();
  //   } else {
  //     $(this).flipOff();
  //   }
  //   // $(value).flip();
  // });


});

function flipOn(){
  $(this).flip(true);
  $(this).data('flipped', true);
}

function flipOff(){
  $(this).flip(false);
  $(this).data('flipped', false);
}
