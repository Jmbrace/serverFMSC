class Api::PixelsController < ApplicationController
  def show
  	# for xPos in 1..1000000
  	# 	for yPos in 1..1000000
  	# 		pixel = Pixel.new()
  	# 		pixel.x = xPos
  	# 		pixel.y = yPos
  	# 		pixel.save
  	# 	end
  	# end

  	Pixel.delete_all
  end
end
