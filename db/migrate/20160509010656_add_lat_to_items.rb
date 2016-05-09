class AddLatToItems < ActiveRecord::Migration
  def change
    add_column :items, :lat, :integer
  end
end
