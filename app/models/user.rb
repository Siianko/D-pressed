class User < ApplicationRecord
  after_initialize :set_default_role, :if => :new_record?
  
  enum role: {basic_user: 0, subscriber: 2, author: 4, editor: 8}
  
  has_many :articles
  has_many :ratings
  has_many :comments

  geocoded_by :coordinates
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_default_role
    self.role ||= :basic_user
  end

  def coordinates
    [self.latitude, self.longitude]
  end
end
