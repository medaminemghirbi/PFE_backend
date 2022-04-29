class Removecolumninreviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :commentClient , :string 
    
    remove_column :reviews, :commentFreelancer , :string 
  end
end
