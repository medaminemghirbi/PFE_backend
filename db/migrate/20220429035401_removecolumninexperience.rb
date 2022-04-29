class Removecolumninexperience < ActiveRecord::Migration[7.0]
  def change
    remove_column :experiences, :langugage , :integer 
    
    remove_column :experiences, :languagerating , :integer 
    
  end
end
