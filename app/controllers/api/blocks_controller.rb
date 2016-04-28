class Api::BlocksController < ApplicationController
  
  def show
    render json: Block.where(status: "").first(3)
  end
end

  # Thread.new do
  	# for blockX in 1..250 
  	# 	for blockY in 1..50
  	# 	  block = Block.new()
  	# 	  block.leftXCrnr = (blockX-1) * 16
  	# 	  block.leftYCrnr = (blockY-1) * 15
  	# 	  block.status = ""
  	# 	  block.save
  	# 	end
  	# end
  # 	ActiveRecord::Base.connection.close
  # end


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
  	#render json: {message: Block.count } 