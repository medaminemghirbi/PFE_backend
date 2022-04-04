class User < ApplicationRecord
  
  before_create :confirmation_token
  has_secure_password
  validates_presence_of :email,  :firstname, :lastname , :role 
  validates_uniqueness_of :email
  has_many :educations
  enum role: [:freelancer, :client,:admin ]
  has_many :experiences

  has_one_attached :image


  def image_url
    #Get the URL of the associated image
    image.attached? ? url_for(image) : nil
  end


  def generate_password(len=4)
    chars     = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    password  = Array.new(len){ chars[rand(chars.size)] }.join
    self.password = self.password_confirmation = password
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
  end

  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
