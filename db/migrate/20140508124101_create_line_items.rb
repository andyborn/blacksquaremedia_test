class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :order
      t.references :product
      t.integer :quantity

      t.timestamps
    end
    add_index :line_items, :product_id
  end
end
