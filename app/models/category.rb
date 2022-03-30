class Category < ApplicationRecord

  has_one_attached :avatar



  validates_presence_of :name , :avatar 

  has_many :missions 


end
