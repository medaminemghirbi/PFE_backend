class Updatemissions < ActiveRecord::Migration[7.0]
  def change
    remove_column :missions, :user_id , :integer 
    add_column :missions, :client_id, :integer  , foreign_key: true
    add_index :missions, :client_id
    #Ex:- add_index("admin_users", "username")
    add_column :missions, :freelancer_id, :integer , foreign_key: true
    add_index :missions, :freelancer_id
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
