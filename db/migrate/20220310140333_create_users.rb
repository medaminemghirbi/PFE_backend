class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :lastname
      t.string :firstname
      t.string :email
      t.string :adresse
      t.date :birthday
      t.string :password_digest
      t.string :sexe
      t.float :rating
      t.integer :phone
      t.string :job
      t.string :description
      t.string :photo
      t.string :role

      t.timestamps
    end
  end
end
