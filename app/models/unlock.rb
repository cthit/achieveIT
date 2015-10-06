class Unlock < ActiveRecord::Base
	belongs_to :achievement

  scope :for_user, -> (cid) { where(cid: cid) }

	validates :cid, :achievement, presence: true
	validates :achievement, uniqueness: { scope: :cid }

end
