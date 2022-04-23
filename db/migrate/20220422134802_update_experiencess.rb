class UpdateExperiencess < ActiveRecord::Migration[7.0]
  def change
    remove_column :experiences, :freelancer_id , :integer 
    
    add_column :experiences, :user_id, :integer , foreign_key: true
    add_index :experiences, :user_id
  end
end
