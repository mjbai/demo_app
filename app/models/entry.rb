class Entry < ActiveRecord::Base
  attr_accessible :def, :user_id, :word

  belongs_to :user

  validates :word, :length => { :maximum => 140 }

end
