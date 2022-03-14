class CreateEducation < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.date :datedebut
      t.date :datefin
      t.string :ecole

      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
