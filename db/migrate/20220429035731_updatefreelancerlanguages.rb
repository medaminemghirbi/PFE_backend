class Updatefreelancerlanguages < ActiveRecord::Migration[7.0]
  def change
    add_index :freelancer_languages, [:language_id, :user_id], unique: true
  end
end
