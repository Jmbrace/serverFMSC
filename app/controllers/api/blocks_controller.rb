class Api::BlocksController < ApplicationController
  
  def show

  Thread.new do
  	for blockX in 1..250 
  		for blockY in 1..100
  		  block = Block.new()
  		  block.leftXCrnr = (blockX-1) * 16
  		  block.leftYCrnr = (blockY-1) * 15
  		  block.status = ""
  		  block.save
  		end
  	end
  	ActiveRecord::Base.connection.close
  end


  # Thread.new do
  # 	for blockX in 1..250 
  # 		for blockY in 101..200
  # 		  block = Block.new
  # 		  block.leftXCrnr = (blockX-1) * 16
  # 		  block.leftYCrnr = (blockY-1) * 15
  # 		  block.status = ""
  # 		end
  # 	end
  # ActiveRecord::Base.connection.close
  # end
  	# for blockX in 1..250 
  	# 	for blockY in 101..200
  	# 	  block = Block.new
  	# 	  block.leftXCrnr = (blockX-1) * 16
  	# 	  block.leftYCrnr = (blockY-1) * 15
  	# 	  block.status = ""
  	# 	end
  	# end
  	# Block.delete_all
  	render json: {message: "Block.count" } 
  end

end
