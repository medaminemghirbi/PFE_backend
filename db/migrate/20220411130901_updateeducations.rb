class Updateeducations < ActiveRecord::Migration[7.0]
  def change
    remove_column :educations, :user_id , :integer 
    
    add_column :educations, :freelancer_id, :integer  , foreign_key: true
    add_index :educations, :freelancer_id
  end
end
