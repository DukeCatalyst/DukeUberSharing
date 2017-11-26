class EditPostFields < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :departure_time, :datetime
    remove_column :posts, :date
    remove_column :posts, :time
  end
end
