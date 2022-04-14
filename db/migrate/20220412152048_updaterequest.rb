class Updaterequest < ActiveRecord::Migration[7.0]
  def change
    add_column :Reqeuest, :mission_id, :integer
    add_index  :Reqeuest, :mission_id
    add_column :Reqeuest, :freelancer_id, :integer
    add_index  :Reqeuest, :freelancer_id
  end
end
