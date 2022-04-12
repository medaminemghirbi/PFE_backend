class Updateexperiences < ActiveRecord::Migration[7.0]
  def change
    remove_column :experiences, :user_id , :integer 
    
    add_column :experiences, :freelancer_id, :integer , foreign_key: true
    add_index :experiences, :freelancer_id
  end
end
