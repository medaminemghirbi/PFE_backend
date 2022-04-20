class User < ApplicationRecord
  include Rails.application.routes.url_helpers

  before_create :confirmation_token

  has_secure_password
  validates_presence_of :email,  :firstname, :lastname , :role 
  
  validates_uniqueness_of :email

  has_many :educations, dependent: :destroy

  enum role: [:freelancer, :client,:admin ]

  has_many :experiences , dependent: :destroy

  has_one_attached :avatar

  def user_image_url
    #Get the URL of the associated image
    avatar.attached? ? url_for(avatar) : nil
  end


 # def generate_password(len=4)
  #  chars     = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
   # password  = Array.new(len){ chars[rand(chars.size)] }.join
    #self.password = self.password_confirmation = password
  #end

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