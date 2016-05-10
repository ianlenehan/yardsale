class ChangeUsersLongColumnName < ActiveRecord::Migration
  def change
    change_column :users, :long, :float
    rename_column :users, :long, :longitude
  end
end
