class Addratingforusers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :rating , :integer 

    add_column :users, :reviews_count, :integer, default: 0 , inclusion: 0..10
  end
end
