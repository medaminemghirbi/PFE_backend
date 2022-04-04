class Mission < ApplicationRecord
    
    validates_presence_of :title , :description , :duration , :beginingDate , :contrat

    belongs_to :user 

    belongs_to :category

    belongs_to :language
    
end
