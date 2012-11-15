class Entry < ActiveRecord::Base
  attr_accessible :context, :definition, :example_sentence, :image,  :word
  belongs_to :user
  
  validates :word, presence: true, length: { maximum: 50} 
  
  validates :user_id, presence: true
  default_scope order: 'entries.created_at DESC'
end
