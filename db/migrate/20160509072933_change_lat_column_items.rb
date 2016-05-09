class ChangeLatColumnItems < ActiveRecord::Migration
  def change
    change_column :items, :lat, :decimal
  end
end
