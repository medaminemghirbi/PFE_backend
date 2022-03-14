class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email, :password, :firstname, :lastname
  validates_uniqueness_of :email
  has_many :educations
end
