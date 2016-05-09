class AddLongToItems < ActiveRecord::Migration
  def change
    add_column :items, :long, :integer
  end
end
