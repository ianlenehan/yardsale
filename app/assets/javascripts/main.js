$(document).ready(function() {

  $('.fav').on('click', function () {
    $(this).attr('src', '/assets/favStar.png');
  });

  $('.item-holder').swipe({
    swipeLeft:function() {
      $(this).append('<img src="assets/favStar.png" class="fav magictime"></img>');
      $(this).find('.fav').addClass('spaceInLeft');
      var $that = this;
      setTimeout( function () {
        $that.find('.fav').removeClass('spaceInLeft');
      }, 2000);
        console.log('you swiped left');
    },

    swipeRight:function() {
      $(this).find('.fav').addClass('holeOut');
      setTimeout( function () {
        $(this).find('.fav').remove();
      }, 2000);
      console.log("you swiped right");
    }

  });

  $('#update-location').on('click', function () {
    navigator.geolocation.getCurrentPosition(success, error, options);
  });

});
