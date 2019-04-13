class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :img_path
      t.references :product
      t.timestamps
    end
  end
end
