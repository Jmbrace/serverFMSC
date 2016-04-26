

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
	# update the actual images
	pixel = Pixel.new()
	pixel.x = 10
	pixel.y = 10
	listOfPixelsIDs = Array.new
	listOfPixelsIDs << pixel 
	
	updateImage(listOfPixelsIDs)

  end

  def destroy
  end

  private

    def purchase_params
      params.require(:purchase).permit(:message, :listOfPixelsIDs, :location)
    end

	def updateImage(listOfPixelsIDs)
		# currentImage = ChunkyPNG::Image.from_file('app/assets/images/current.png')
		# masterImage = ChunkyPNG::Image.from_file('app/assets/images/master.png')

		# # for id in listOfPixelsIDs
		# # 	pixel = Pixel.find(id)
		# for pixel in listOfPixelsIDs
		# 	currentImage[pixel.x,pixel.y] = masterImage[pixel.x,pixel.y]

		# 	puts "is this happenning??\n"
		# end  

		# png.save("current.png", :interlace => true)

		# update aws S3 files 
		# require 'aws-sdk'

		# s3 = Aws::S3::Resource.new(region:'us-west-2')
		# obj = s3.bucket(ENV['S3_BUCKET_NAME']).object(key: ENV['AWS_SECRET_ACCESS_KEY'])
		# obj.upload_file('app/assets/images/current.png')
	end 
end
