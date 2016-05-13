var removeButton;
var removeDigitsWindow;

$(document).ready(function () {

  removeButton = function () {
    $('#login').fadeOut();
  };

  removeDigitsWindow = function () {
    $('.my-digits-container').empty();
  };

});


/* Launch the Login to Digits flow. */
var onLoginButtonClick = function (event){
  console.log('clicked');
  removeButton();
  Digits.embed({
    phoneNumber: '+61',
    container: '.my-digits-container'
  })
    .done(onLogin); /*handle the response*/
    // .fail(onLoginFailure);
};

/* Validate and log use in. */
var onLogin = function (loginResponse){
  document.querySelectorAll('.my-digits-container').innerHTML = null;
  // Send headers to your server and validate user by calling Digits’ API
  var oAuthHeaders = loginResponse.oauth_echo_headers;
  var verifyData = {
    authHeader: oAuthHeaders['X-Verify-Credentials-Authorization'],
    apiUrl: oAuthHeaders['X-Auth-Service-Provider']
  };

  var onLoginFailure = function (loginResponse) {
    console.log("Login failed");
  };

  var success = function (loginResponse) {
    var phone = loginResponse.phone;
    console.log(loginResponse);
    removeDigitsWindow();
    window.location.pathname = '/session/' + phone;
  };

  $.ajax({
    type: "POST",
    url: '/verify',
    data: verifyData,
    success: success,
    dataType: 'json'
  });

};

$(document).ready(function () {

  $('#digits-sdk').on('load', function () {
    Digits.init({ consumerKey: 'e1SWhR3fwM8ftCJw0uQ93mY3J' });
  });

  $('body').on('tap', '#login', onLoginButtonClick);

});
