$(document).ready(function(){

  console.log('loaded bro!');
  function toggleMenu() {
    var card = $(this).find('.card');
    if ($(this).find('.card').hasClass('flipped')) {
      card.removeClass('flipped');
      console.log('unflipped');
    } else {
      card.addClass('flipped');
      console.log('flipped');
    }
  }

  $('#js-flip-1').click(toggleMenu);
  $('.flip').each(function(i, v) {
    $(v).click(toggleMenu);
  });


});
