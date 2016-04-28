class Api::PaymentsController < ApplicationController
  require "rubygems"
  require "braintree"

  Braintree::Configuration.environment = :sandbox
  Braintree::Configuration.merchant_id = ENV['MERCHANT_ID']
  Braintree::Configuration.public_key = ENV['PUBLIC_KEY']
  Braintree::Configuration.private_key = ENV['PRIVATE_KEY']

  def show
  	 @token = Braintree::ClientToken.generate
  	 render json: { token: @token }
  end


  def create
    nonce = params[:payment_method_nonce]
    message = params[:message]
    result = Braintree::Transaction.sale(
    :amount => params[:amount], #"10.00", #could be any other arbitrary amount captured in params[:amount] if they weren't all $10.
    :payment_method_nonce => nonce,
    :options => {
      :submit_for_settlement => true
      }
    )

    
    render json: { message: "We did it" }
  end

 # def create
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
  #end
end
