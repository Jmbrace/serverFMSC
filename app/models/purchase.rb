class Purchase < ActiveRecord::Base
   has_many :blocks
   belongs_to :user
end
