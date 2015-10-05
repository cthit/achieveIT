class Provider < ActiveRecord::Base
  before_create :generate_access_token

  has_many :achievements

  validates :name, presence: true, uniqueness: true


  private
  def generate_access_token
    begin
      self.api_key = SecureRandom.hex
    end while self.class.exists?(api_key: api_key)
  end

end
