class Review < ApplicationRecord

    belongs_to :user ,   class_name: "User", foreign_key: "user_id" , optional: true , counter_cache: true

    belongs_to :mission ,   class_name: "Mission", foreign_key: "mission_id" , optional: true 
    
   # validates_inclusion_of :value , :in => 1..10

# has_one :client, class_name: "client", foreign_key: "client_id"

# has_one :freelancer, class_name: "freelancer", foreign_key: "freelancer_id"

# has_one :mission, class_name: "mission", foreign_key: "mission_id"

end
