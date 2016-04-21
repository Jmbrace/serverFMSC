class Purchase < ActiveRecord::Base
   has_many :pixles
   belongs_to :user
end
