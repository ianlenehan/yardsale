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
  $('#location-saved').text('Location Saved!');
  setTimeout( function () {
    $('#location-saved').fadeOut();
  }, 1500);

  console.log('Your current position is:');
  console.log('Latitude : ' + crd.latitude);
  console.log('Longitude: ' + crd.longitude);
  console.log('More or less ' + crd.accuracy + ' meters.');
};

var error = function(err) {
  console.warn('ERROR(' + err.code + '): ' + err.message);
};

$(document).ready(function () {
  $('#update-location').on('click', function () {
    navigator.geolocation.getCurrentPosition(success, error, options);
  });

  $('#save-location').on('click', function () {
    $('.ui-page').append('<div id="location-saved">Getting location...</div>');
    $('#location-saved').fadeIn();
    navigator.geolocation.getCurrentPosition(success, error, options);
  });

  $('#current-location').on('click', function (e) {
    e.preventDefault();
    $('.ui-page').append('<div id="location-saved">Getting location...</div>');
    $('#location-saved').fadeIn();
    navigator.geolocation.getCurrentPosition(success, error, options);
  });

  $('#default-location').on('click', function (e) {
    e.preventDefault();
    var lat = $('#hidden-lat').text();
    var long = $('#hidden-long').text();
    $('.lat-input').val(lat);
    $('.long-input').val(long);
    $('.ui-page').append('<div id="location-saved">Location Saved!</div>');
    $('#location-saved').fadeIn();
    setTimeout( function () {
      $('#location-saved').fadeOut();
    }, 1500);
  });

  $('.thumb').click(function() {
    console.log('loaded');
    var mapsSuccess = function(pos) {
      var crd = pos.coords;
      lat = crd.latitude;
      long = crd.longitude;

      console.log('Your current position is:');
      console.log('Latitude : ' + crd.latitude);
      console.log('Longitude: ' + crd.longitude);
      console.log('More or less ' + crd.accuracy + ' meters.');
    };

    navigator.geolocation.getCurrentPosition(mapsSuccess, error, options);

  });

});
