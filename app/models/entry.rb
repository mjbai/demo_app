#require 'rest-open-uri'

class Entry < ActiveRecord::Base

  attr_accessible :context, :definition, :example_sentence, :image,  :word
  belongs_to :users
  #has_attached_file :image
  
  validates :word, presence: true, length: { maximum: 50} 
  
  validates :user_id, presence: true
  default_scope order: 'entries.created_at DESC'

  private
  #Get the picture from a given url. 
   def picture_from_url(url)
      self.image = open(url)
   end

end
