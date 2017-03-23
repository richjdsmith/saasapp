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
    // collect the credit card fields.
      var ccNum = $('#card_number').val(),
          cvcNum = $('#card_code').val(),
          expMonth = $('#card_month').val(),
          expYear = $('#card_year').val();
    // send the card info to stripe
      Stripe.createToken({
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
      }, stripeResponseHandler);
  });

  // Stripe will return back a card token
  // Inject card token as hidden field into form
  // submit form to our rails app.

});
