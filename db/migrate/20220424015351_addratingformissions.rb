class Addratingformissions < ActiveRecord::Migration[7.0]
  def change
    add_column :missions, :reviews_count, :integer, default: 0 , inclusion: 0..10
  end
end
