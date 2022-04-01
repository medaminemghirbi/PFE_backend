class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email,  :firstname, :lastname , :role 
  validates_uniqueness_of :email
  has_many :educations
  enum role: [:freelancer, :client,:admin ]
  has_many :experiances

  #has_one_attached :avatar

end
