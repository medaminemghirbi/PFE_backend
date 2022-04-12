class Mission < ApplicationRecord
    
    validates_presence_of :title , :description , :duration , :beginingDate , :contrat

    belongs_to :client , class_name: "Client" , foreign_key: "client_id" 
    belongs_to :freelancer , class_name: "Freelancer" , foreign_key: "freelancer_id" ,optional: true

    belongs_to :category

    belongs_to :language
    
end
