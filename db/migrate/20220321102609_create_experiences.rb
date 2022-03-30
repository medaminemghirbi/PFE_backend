class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|

      t.string :dateDebut 
      t.string :dateFin 
      t.string :jobType
      t.string :description
      t.string :entreprise 

      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
