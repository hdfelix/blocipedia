Rails.configuration.stripe = {
	publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
	secret_key:			 ENV['STIPRE_SECRET_KEY'],

	publishable_key_test:	ENV['STRIPE_PUBLISHABLE_KEY_TEST'],
	secret_key_test: ENV['STRIPE_SECRET_KEY_TEST']
}

#Set our app-stored secret key with Stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]
