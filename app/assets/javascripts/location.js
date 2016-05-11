var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

var lat;
var long;

var success = function(pos) {
  var crd = pos.coords;
  lat = crd.latitude;
  long = crd.longitude;
  $('.lat-input').val(lat);
  $('.long-input').val(long);
  $('#location-saved').remove();
  $('.ui-page').append('<div id="location-saved"><i class="fa fa-check fa-2x fa-fw margin-bottom"></i></div>');
  $('#location-saved').toggle();
  setTimeout( function () {
    $('#location-saved').fadeOut();
  }, 1500);

  console.log('Your current position is:');
  console.log('Latitude : ' + crd.latitude);
  console.log('Longitude: ' + crd.longitude);
  console.log('More or less ' + crd.accuracy + ' meters.');
};

var userSuccess = function(pos) {
  var crd = pos.coords;
  lat = crd.latitude;
  long = crd.longitude;
  $('#user_latitude').val(lat);
  $('#user_longitude').val(long);
  $('.ui-page').append('<div id="location-saved"><i class="fa fa-check fa-2x fa-fw margin-bottom"></i></div>');
  $('#location-saved').toggle();
  setTimeout( function () {
    $('#location-saved').fadeOut();
  }, 1500);

  console.log('Your current position is:');
  console.log('Latitude : ' + crd.latitude);
  console.log('Longitude: ' + crd.longitude);
  console.log('More or less ' + crd.accuracy + ' meters.');
};

var updateSuccess = function(pos) {
  var crd = pos.coords;
  lat = crd.latitude;
  long = crd.longitude;

  var onSuccess = function () {
    $('#location-saved').remove();
    $('.ui-page').append('<div id="location-saved"><i class="fa fa-check fa-2x fa-fw margin-bottom"></i></div>');
    $('#location-saved').toggle();
    setTimeout( function () {
      $('#location-saved').fadeOut();
      document.location.reload(true);
    }, 1500);
  };

  var locData = {
    lat: lat,
    long: long
  };

    $.ajax({
      type: "POST",
      url: '/updatelocation',
      data: locData,
      success: onSuccess,
      dataType: 'json'
    });


  console.log('Your current position is:');
  console.log('Latitude : ' + crd.latitude);
  console.log('Longitude: ' + crd.longitude);
  console.log('More or less ' + crd.accuracy + ' meters.');
};

var error = function(err) {
  console.warn('ERROR(' + err.code + '): ' + err.message);
};

$(document).ready(function () {

  // update current location in item view
  $(document).on('click', '#update-location', function () {
    $('.ui-page').append('<div id="location-saved"><i class="fa fa-refresh fa-spin fa-2x fa-fw margin-bottom"></i></div>');
    $('#location-saved').fadeIn();
    navigator.geolocation.getCurrentPosition(updateSuccess, error, options);
  });

  // update sample location in item view
    $(document).on('click', '#sample-location', function (e) {
      e.preventDefault();

    var locData = {
      lat: -33.861957,
      long: 151.173541
    };

      $.ajax({
        type: "POST",
        url: '/updatelocation',
        data: locData,
        dataType: 'json'
      });


      $('.ui-page').append('<div id="location-saved">Location Updated!</div>');
      $('#location-saved').fadeIn();
      setTimeout( function () {
        $('#location-saved').fadeOut();
        document.location.reload(true);
      }, 1500);
    });

// save my current location as default
  $(document).on('click', '#save-location', function () {
    $('.ui-page').append('<div id="location-saved"><i class="fa fa-refresh fa-spin fa-2x fa-fw margin-bottom"></i></div>');
    $('#location-saved').fadeIn();
    navigator.geolocation.getCurrentPosition(userSuccess, error, options);
  });

// list item with current location
  $(document).on('click', '#current-location', function (e) {
    e.preventDefault();
    $('.ui-page').append('<div id="location-saved">Getting location...</div>');
    $('#location-saved').fadeIn();
    navigator.geolocation.getCurrentPosition(success, error, options);
  });

// list item with user's default location
  $(document).on('click', '#default-location', function (e) {
    e.preventDefault();
    var lat = $('#hidden-lat').text();
    var long = $('#hidden-long').text();
    $('.lat-input').val(lat);
    $('.long-input').val(long);
    $('.ui-page').append('<div id="location-saved"><i class="fa fa-check fa-2x fa-fw margin-bottom"></i></div>');
    $('#location-saved').fadeIn();
    setTimeout( function () {
      $('#location-saved').fadeOut();
    }, 1500);
  });

  $(document).on('click', '#add-km', function () {
    console.log('add km');
    $.ajax({
      type: "GET",
      url: '/items',
      data: { km: 10 },
    }).done( function (result) {
      var updatedList = $(result)[6];
      $('.items-list').html(updatedList);
    });
  });



});
