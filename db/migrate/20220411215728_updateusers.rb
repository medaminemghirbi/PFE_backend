class Updateusers < ActiveRecord::Migration[7.0]
  def change
    
    add_column :users, :language_id, :integer  , foreign_key: true
    add_index :users, :language_id
  end
end
