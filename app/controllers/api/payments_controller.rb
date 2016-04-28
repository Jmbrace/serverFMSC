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
    numOfMeals = params[:numOfMeals]
    state  = params[:state]
    numOfBlocks = numOfMeals/20
    listOfBlocks = []
    counter = 0
    while counter < numOfBlocks
      block = Block.where(status: "")
      # block.status = "purchased"
      # block.message = message
      # block.save
      listOfBlocks.push(block)
      counter = counter + 1
    end
    result = Braintree::Transaction.sale(
    :amount => params[:amount], #"10.00", #could be any other arbitrary amount captured in params[:amount] if they weren't all $10.
    :payment_method_nonce => nonce,
    :options => {
      :submit_for_settlement => true
      }
    )
    # updateImage(listOfBlocks)
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

    def updateImage(listOfBlocks)
    require 'aws-sdk'
    require "rmagick"
    require "open-uri"

    s3 = Aws::S3::Resource.new(:access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
                          :region => 'us-west-2')

    bucket = s3.bucket(ENV['S3_BUCKET_NAME'])

    # cache the current image to the server to process it 
    File.open('app/assets/images/current.png', 'wb') do |fo|
      fo.write open("https://s3-us-west-2.amazonaws.com/fmsc4262016/current.png").read 
    end

      # copy the pixels 
    current = Magick::Image.read("app/assets/images/current.png").first
    master = Magick::Image.read("app/assets/images/master.png").first

    for id in listOfBlocks
      (0..15).each do |i|
        (0..14).each do |j|
          block = Block.find(id)  
          x = block.leftXCrnr + i
          y = block.leftYCrnr + j 
          current.pixel_color(x, y, master.pixel_color(x, y))
        end
      end
    end 

    # write back to the aws bucket 
    current.write("app/assets/images/current.png")
    bucket.object('current.png').upload_file('app/assets/images/current.png')
  
    # update permissions of the object such that everyone can view it   
  end 

  def pay_params
      params.require(:payment_method_nonce).permit(:message, :numOfMeals, :state)
  end
end
