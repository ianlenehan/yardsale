class ChangeUsersLatColumnName < ActiveRecord::Migration
  def change
    change_column :users, :lat, :float
    rename_column :users, :lat, :latitude
  end
end
