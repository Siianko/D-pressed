class User < ApplicationRecord
  enum role: [:user, :subscriber, :author, :editor]
  has_many :articles

  after_initialize :set_default_role, :if => :new_record?
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_default_role
    self.role ||= :user
  end
end
