class Entry < ActiveRecord::Base
  attr_accessible :context, :definition, :example_sentence, :word
  belongs_to :user
  
  validates :user_id, presence: true
end
