class UpdateUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :earning, :integer
    add_column :users, :earning, :integer, default: 0
  end
end
