class Achievement < ActiveRecord::Base

	validates :points, numericality: { greater_than_or_equal_to: 0 }, 
				presence: true
	validates :name, uniqueness: true, presence: true, 
				length:{minimum: 4, maximum: 80}

end
