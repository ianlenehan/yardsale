class ChangeLatColumnUsers < ActiveRecord::Migration
  def change
    change_column :users, :lat, :decimal
  end
end
