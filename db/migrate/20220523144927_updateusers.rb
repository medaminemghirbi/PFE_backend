class Updateusers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :rib , :integer 
   
  end
end