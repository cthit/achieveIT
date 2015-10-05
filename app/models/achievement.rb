class Achievement < ActiveRecord::Base

	validates :points, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :code, :name, :provider, presence: true
	validates :name, presence: true, length: { minimum: 4, maximum: 80 }
  validates :code, uniqueness: { scope: :provider }

  belongs_to :provider

  has_many :unlocks

end
