class Api::PixelsController < ApplicationController
  


  def show



	# batch,batch_size = [], 1_000_000

	# Thread.new do
	# 	 for xPos in 1..1000
	#   		for yPos in 1..1000
	#   			pixel = Pixel.new()
	#   			pixel.x = xPos
	#   			pixel.y = yPos
	#   			# batch << pixlel
	#   			pixel.save
	#   		end
	#   	end
	# 	ActiveRecord::Base.connection.close
	# end
	  # if batch.size >= batch_size
	  #   Product.import batch
	  #   batch = []
	  # end
	# Product.import batch
	  	 # Pixel.delete_all
	  	render json: {
	  		:amount => Pixel.count 
  			:one => Pixel.find(0)
	  	}
	  end
end
