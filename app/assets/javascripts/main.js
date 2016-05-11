$(document).ready(function() {

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

  $(document).on('change', '#category_name', function() {
    var category = $(this).val();
    $.ajax({
      type: "GET",
      url: '/items',
      data: {
        category: category
      },
    }).done(function(result) {
      var updatedList = $(result).filter(function() {
        return $(this).children("li").length !== 0;
      });
      // var updatedList = $(result).eq(6);
      $('.items-list').html(updatedList);

    });
      });

    $(document).on('scroll', window, function() {
      $('.footer-nav').fadeOut();
    });

    $(document).on('scroll', window, function() {
      clearTimeout($.data(this, 'scrollTimer'));
      $.data(this, 'scrollTimer', setTimeout(function() {
        $('.footer-nav').fadeIn();
      }, 250));
    });


});
