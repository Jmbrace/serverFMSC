class Api::PaymentsController < ApplicationController

  def show

  end

  def create
 #  	Stripe.api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2"

	# # Get the credit card details submitted by the form
	# token = params[:stripeToken]
	# numOfMeals = params[:numOfMeals]

	# # Create the charge on Stripe's servers - this will charge the user's card
	# begin
 #  	charge = Stripe::Charge.create(
 #    	:amount => 1000, # amount in cents, again
 #    	:currency => "usd",
 #    	:source => token,
 #    	:description => "Example charge"
 #  	)
 #  	render json: { message: "payment processed" }
	# rescue Stripe::CardError => e
 #  	  render json: { error: "Card Declined" }
	# end
  end
end
