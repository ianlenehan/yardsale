class ChangeItemsLatColumnName < ActiveRecord::Migration
  def change
    change_column :items, :lat, :float
    rename_column(:items, :lat, :latitude)
  end
end
