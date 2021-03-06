

class Api::PurchasesController < ApplicationController
  def show
  end

  def create
		purchase = Purchase.new(purchase_params)

		if purchase.save
			for id in params[:listOfPixelsIDs]
				pixel = Pixel.find(id)
				pixel.status = "bought"
				pixel.purchase_id = purchase.id
				pixel.save
			end	

			# update the image 
			updateImage(params[:listOfPixelsIDs])
      #render json: user, status: 201, location: [:api, user]
    else
      #render json: { errors: user.errors }, status: 422, message: "Something went wrong"
    end

  end

  def update


	# pixel = Pixel.new()
	# pixel.x = 1
	# pixel.y = 1
	# listOfPixelsIDs << pixel 
	
	# pixel2 = Pixel.new()
	# pixel2.x = 2
	# pixel2.y = 1
	# listOfPixelsIDs << pixel2

	# update the actual images
	listOfBlockIDs = Array.new

	Thread.new do
		updateImage(listOfBlockIDs)
		ActiveRecord::Base.connection.close
	end

	render json: { message: "yo" }
  end

  def destroy
  end

  private

    def purchase_params
      params.require(:purchase).permit(:message, :listOfPixelsIDs, :location)
    end

	def updateImage(listOfBlockIDs)
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

		for id in listOfBlockIDs
			(1..16).each do |i|
				(1..15).each do |j|
				 	block = Block.find(id)	
				 	x = block.x + i
				 	y = block.y + j 
				 	current.pixel_color(x, y, master.pixel_color(x, y))
				end
			end
		end 

		# write back to the aws bucket 
		current.write("app/assets/images/current.png")
		bucket.object('current.png').upload_file('app/assets/images/current.png')
	
		# update permissions of the object such that everyone can view it 	
	end 
end
