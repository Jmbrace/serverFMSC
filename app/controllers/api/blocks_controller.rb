class Api::BlocksController < ApplicationController
  
  def show
  	for blockX in 1..250 
  		for blockY in 1..100
  		  block = Block.new()
  		  block.leftXCrnr = (blockX-1) * 16
  		  block.leftYCrnr = (blockY-1) * 15
  		  block.status = ""
  		end
  	end

  	# for blockX in 1..250 
  	# 	for blockY in 101..200
  	# 	  block = Block.new
  	# 	  block.leftXCrnr = (blockX-1) * 16
  	# 	  block.leftYCrnr = (blockY-1) * 15
  	# 	  block.status = ""
  	# 	end
  	# end

  	render json: {message: Block.count } 
  end

end
