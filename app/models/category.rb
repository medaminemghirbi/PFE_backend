class Category < ApplicationRecord
  
  validates_presence_of :name, :image 

  has_many :missions 

  #has_one_attached :image

  # validates :image, attached: true

  def image_url
    #Get the URL of the associated image
    image.attached? ? url_for(image) : nil
  end

  def get_image_url
    url_for(self.image)
  end

end
