class Unlock < ActiveRecord::Base
	belongs_to :achievement

	validates :cid, :achievement, presence: true
	validates :achievement, uniqueness: { scope: :cid }

end
