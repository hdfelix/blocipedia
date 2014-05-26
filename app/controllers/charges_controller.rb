class ChargesController < ApplicationController

	def new
		# To avoid a large hash in haml
		@stripe_btn_hash = {
			src: "https://checkout.stripe.com/checkout.js",
			class: 'stripe-button',
			data: {
				key: "#{ Rails.configuration.stripe[:publishable_key] }",
				description: "Blocipedia (premium) - #{current_user.name}",
				amount: 1_00
			}
		}
			binding.pry
	end

	def create
		binding.pry
		@amount = params[:amount]

		#Creates a Stripe Customer object, for associating with the charge
		customer = Stripe::Customer.create(
			email: current_user.email,
			card: params[:stripeToken]
		)

		Stripe::Charge.create(
			customer: customer.id,	#this is NOT the use_id in the app
			amount: @amount,
			description: "Blocipedia - #{current_user.name}",
			currency: 'usd'
		)

		flash[:success] = "Thank you for your payment, #{current_user.name}!"
		redirect_to '/charges/new'

		# Stripe will send back CardErrors, with friendly messages when something goes wrong.
		# This 'rescue block' catches and displays those errors
	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end

	private

	def charge_params
		params.require(:charge).permit(:stripeToken, :amount)
	end
end
