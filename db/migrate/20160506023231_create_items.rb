class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.text :image
      t.integer :price
      t.boolean :negotiable, default: false
      t.boolean :charity, default: false
      t.date :closed
      t.integer :flags, default: 0
      t.timestamps null: false
    end
  end
end
