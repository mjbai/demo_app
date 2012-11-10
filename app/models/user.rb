class User < ActiveRecord::Base
  attr_accessible :email, :first, :last
  
  validates :first, presence: true, length: { maximum: 50}
  validates :last, presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  
  has_many :entries
end
