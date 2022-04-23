class UpdateEducationss < ActiveRecord::Migration[7.0]
  def change
    remove_column :educations, :freelancer_id , :integer 
    
    add_column :educations, :user_id, :integer  , foreign_key: true
    add_index :educations, :user_id
  end
end
