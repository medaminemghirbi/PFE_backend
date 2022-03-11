class Createuser < ActiveRecord::Migration[7.0]
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
      t.boolean :isadmin
      t.boolean :isclient
      t.boolean :isfreelancer
      t.integer :earning
      t.timestamps
    end
  end
end
