//   $(document).on('swipeleft', '.item-holder', function() {
//     console.log('you swiped left');
//
//     var userId = $('#user-id').attr('data');
//     var itemId = $(this).attr('data');
//     console.log("user:", userId, "item:", itemId);
//     var $that = this;
//
//     var success = function() {
//       $that.append('<img src="/assets/favStar.png" class="fav magictime"></img>');
//       $that.find('.fav').addClass('spaceInLeft');
//       setTimeout(function() {
//         $that.find('.fav').removeClass('spaceInLeft');
//       }, 2000);
//     };
//
//     $.ajax({
//       type: "GET",
//       url: '/favourites/new',
//       data: {
//         userID: userId,
//         itemID: itemId
//       },
//       success: success,
//       dataType: 'json'
//     });
//   });
// });

$(document).on('pagecreate', function() {

  $('.fav').on('click', function() {
    $(this).attr('src', '/assets/favStar.png');
  });



  $('.item-holder').swipe({

    swipeLeft: function() {
      console.log('you swiped left');

      var userId = $('#user-id').attr('data');
      var itemId = $(this).attr('data');
      console.log("user:", userId, "item:", itemId);
      var $that = this;

      var success = function() {
        $that.append('<img src="/assets/favStar.png" class="fav magictime"></img>');
        $that.find('.fav').addClass('spaceInLeft');
        setTimeout(function() {
          $that.find('.fav-count').fadeIn();
          $that.find('.fav').removeClass('spaceInLeft');
        }, 2000);
      };

      $.ajax({
        type: "GET",
        url: '/favourites/new',
        data: {
          userID: userId,
          itemID: itemId
        },
        success: success,
        dataType: 'json'
      });
    },

    swipeRight: function() {
      console.log("you swiped right");

      var userId = $('#user-id').attr('data');
      var itemId = $(this).attr('data');
      console.log("user:", userId, "item:", itemId);
      var $that = this;

      var success = function() {
        $that.find('.fav-count').fadeOut();
        $that.find('.fav').addClass('holeOut');
        setTimeout(function() {
          $that.find('.fav').remove();
        }, 2000);
      };

      $.ajax({
        type: "GET",
        url: '/favourites/delete',
        data: {
          userID: userId,
          itemID: itemId
        },
        success: success,
        dataType: 'json'
      });

    }
  });
});
