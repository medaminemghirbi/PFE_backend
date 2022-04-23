class Education < ActiveRecord::Base
  
   # belongs_to :freelancer , class_name: "Freelancer" , foreign_key: "freelancer_id" 
   belongs_to :user 
end