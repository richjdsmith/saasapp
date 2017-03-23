/* global $ */
// Document Ready
$(document).on('turbolinks:load', function(){
  var theForm = $('#pro_form');
  var submitBtn = $('#form-signup-btn');


  // Set Stripe Public Key
  Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content') );


  // When user clicks form submit btn,
  submitBtn.click(function(event){
    // prevent default submission behaviour.
    event.preventDefault();
    submitBtn.val("Processing").prop('disabled', true);
  // collect the credit card fields.
    var ccNum = $('#card_number').val(),
        cvcNum = $('#card_code').val(),
        expMonth = $('#card_month').val(),
        expYear = $('#card_year').val();

  // Use stripe.js lib to check for card errors.
    var error = false;

  // Validate Card number
    if(!Stripe.card.validateCardNumber(ccNum)) {
      error = true;
      alert('The credit card number appears to be invalid');
    }

    // Validate CVC number
    if(!Stripe.card.validateCVC(cvcNum)) {
      error = true;
      alert('The CVC number appears to be invalid');
    }
    // Validate Exiration Date
    if(!Stripe.card.validateExpiry(expMonth, expYear)) {
      error = true;
      alert('The expiration date appears to be invalid');
    }

    if (error) {
    // If there are card errors, don't send to Stripe.
      submitBtn.val("Sign Up").prop('disabled', false);

    } else {
      // send the card info to stripe
      Stripe.createToken({
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
      }, stripeResponseHandler);
      return false;
    }
  }); //End submitBtn click

  // Stripe will return back a card token
  function stripeResponseHandler(status, response) {
    // Get the token from the response.
    var token = response.id;

    // Inject the card token in a hidden field
    theForm.append( $('<input type="hidden" name="user[stripe_card_token]">').val(token) );

    // Submit the form to our rails app.
    theForm.get(0).submit();
  }
});
