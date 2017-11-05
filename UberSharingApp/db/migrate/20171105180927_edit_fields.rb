class EditFields < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :date, :date
    add_column :posts, :time, :time
    add_column :posts, :number_passengers, :integer
    add_column :posts, :departure_location, :string
    remove_column :posts, :name
    remove_column :posts, :content
    remove_column :posts, :title
  end
end
