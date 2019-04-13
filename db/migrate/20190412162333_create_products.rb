class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.date :expire_date
      t.string :name
      t.integer :sku_id
      t.string :categories, array: true, default: []
      t.string :tags, array: true, default: []
      t.float :price

      t.timestamps
    end
  end
end
