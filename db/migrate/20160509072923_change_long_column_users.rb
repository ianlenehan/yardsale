class ChangeLongColumnUsers < ActiveRecord::Migration
  def change
    change_column :users, :long, :decimal
  end
end
