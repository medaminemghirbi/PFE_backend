class CreateMissionLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :mission_languages do |t|

      t.timestamps
    end
  end
end
