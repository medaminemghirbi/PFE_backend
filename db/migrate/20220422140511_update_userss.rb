class UpdateUserss < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :language_id , :integer
  end
end
