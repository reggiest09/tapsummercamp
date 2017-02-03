var subscription;
function validate_form(){
    console.log("I am herereere..");
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
    return subscription.setupForm();
}


subscription = {
    setupForm: function() {
      $(document).on('submit','#new_subscription',function(e){
            e.preventDefault();
            e.stopImmediatePropagation();
            subscription.processCard();
            return false;
    });
  },
  processCard: function() {
        $('input[type=submit]').attr('disabled', true).val('Processing. Please, wait...');
        $('input[type=submit]').addClass('processing');

    var card;
    card = {
        number: $('#card_number').val(),
        cvc: $('#card_code').val(),
        expMonth: $('#card_month').val(),
        expYear: $('#card_year').val()
      };
    return Stripe.createToken(card, subscription.handleStripeResponse);
  },
  handleStripeResponse: function(status, response) {
    if (status === 200) {
      $('#subscription_stripe_card_token').val(response.id);
      $('#new_subscription')[0].submit();
    } else {
      $("#stripe_error").text("Stripe Error: "+response.error.message);
      $('#subscribe_button').removeClass('processing');
      return $('input[type=submit]').attr('disabled', false).val('Subscribe');
    }
  }
};