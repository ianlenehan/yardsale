class ChangeLongColumnItems < ActiveRecord::Migration
  def change
    change_column :items, :long, :decimal
  end
end
