class Mission < ApplicationRecord
    
  validates_presence_of :title , :description , :duration , :beginingDate 
  attribute :completed, :boolean, default: false
  belongs_to :client , class_name: "Client" , foreign_key: "client_id" 
  belongs_to :freelancer , class_name: "Freelancer" , foreign_key: "freelancer_id" ,optional: true

  belongs_to :category

  has_many :mission_languages , dependent: :destroy

  Mission.has_many :languages , through: :mission_languages
  
  has_many :requests
end