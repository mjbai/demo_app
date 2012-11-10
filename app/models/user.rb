class User < ActiveRecord::Base
  attr_accessible :email, :first, :last
  has_many :entries
end
