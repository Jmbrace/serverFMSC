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
	# uploader = AvatarUploader.new
	# image = uploader.retrieve_from_store!('master.png')
	# puts image
  end

  def destroy
  end

  private

    def purchase_params
      params.require(:purchase).permit(:message, :listOfPixelsIDs, :location)
    end

		def updateImage(listOfPixelsIDs)
			currentImage = ChunkyPNG::Image.from_file('currentImage.png')
			masterImage = ChunkyPNG::Image.from_file('masterImage.png')

			for id in listOfPixelsIDs
				pixel = Pixel.find(id)
				currentImage[pixel.x,pixel.y] = masterImage[pixel.x,pixel.y]
			end  

			png.save("currentImage.png", :interlace => true)
		end 

end
