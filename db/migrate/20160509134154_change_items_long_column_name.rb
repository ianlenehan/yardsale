class ChangeItemsLongColumnName < ActiveRecord::Migration
  def change
    change_column :items, :long, :float
    rename_column(:items, :long, :longitude)
  end
end
