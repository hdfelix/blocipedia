jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  user.setupForm()
 
user =
  setupForm: ->
    alert("is this running?")
    $('#new_user').submit ->
      alert("inside submit")
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        user.processCard()
        alert("should have proccesed card")
        false
      else
        alert("no card number")
        true
 
  processCard: ->
    alert("inside processCard")
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    alert("before Stripe.createToken()")
    Stripe.createToken(card, user.handleStripeResponse)
    alert("after Stripe.createToken()")
 
  handleStripeResponse: (status, response) ->
    if status == 200
      alert("inside handleStripeResponse if statement")
      $('#user_stripe_card_token').val(response.id)
      $('#new_user')[0].submit()
    else
      alert("Stripe error: #{status}")
      $('#stripe_error').text(response.error.message)
      $('#stripe_error').show()
      $('input[type=submit]').attr('disabled', false)
