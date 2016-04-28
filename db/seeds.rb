# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  	for blockX in 1..70 
  		for blockY in 1..200
  		Block.create!({leftXCrnr: (blockX-1) * 16, leftYCrnr: (blockY-1) * 15, status: ""})
  		end
  	end

  puts "Created #{Block.count} Blocks"