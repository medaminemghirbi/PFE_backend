class Mission < ApplicationRecord
    
    validates_presence_of :title , :description , :duration , :beginingDate, :client_id
  #  validates :freelancer_id, presence: true, allow_blank: true
    belongs_to :client,   class_name: "Client", foreign_key: "client_id"
    #belongs_to :freelancer,   class_name: "Freelancer", foreign_key: "freelancer_id", optional: true
    has_many :request
    belongs_to :category
    has_many :languages
end
