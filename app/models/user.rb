class User < ApplicationRecord
  has_many :articles

  geocoded_by :coordinates
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def coordinates
    [self.latitude, self.longitude]
  end
end
