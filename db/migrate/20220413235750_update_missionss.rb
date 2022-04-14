class UpdateMissionss < ActiveRecord::Migration[7.0]
  def change
    remove_column :missions, :language_id , :integer 
  end
end
