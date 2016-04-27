class Api::PixelsController < ApplicationController
  


  def show



	# batch,batch_size = [], 1_000_000

	  # if batch.size >= batch_size
	  #   Product.import batch
	  #   batch = []
	  # end
	# Product.import batch
	  	# Pixel.delete_all
	  	render json: { :message => Pixel.count }
	  end
end
