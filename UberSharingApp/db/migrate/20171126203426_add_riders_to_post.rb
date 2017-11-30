class AddRidersToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :riders, :integer, array:true, default: []
  end
end
