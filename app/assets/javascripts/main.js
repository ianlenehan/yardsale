$(document).ready(function() {

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


  $(document).on('click', '#view-items', function() {
    var link = window.location.href.substr(window.location.href.length - 5);
    if (link == 'items') {
      document.location.reload(true);
      console.log(link);
    }
  });

  $(document).on('click', '#view-fav', function() {
    $.ajax({
      type: "GET",
      url: '/items',
      data: {
        favourites: true
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
