class Entry < ActiveRecord::Base
  attr_accessor :imageurl
  attr_accessible :context, :definition, :example_sentence, :image,  :word, :user_id, :imageurl
  belongs_to :user
  has_attached_file :image, :default_url => "../../default.png"
 #   :styles => {
  #    :thumb=> "100x100#" }	  
  
  validates :word, presence: true, length: { maximum: 50} 
  
  validates :user_id, presence: true
  default_scope order: 'entries.created_at DESC'

  #Get the picture from a given url. 
   def picture_from_url(url)
      unless url.nil? or url == ""
      	self.image = URI.parse(url)
      end
   end

end
