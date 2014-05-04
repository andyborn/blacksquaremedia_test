class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.decimal :vat_rate, precision: 6, scale: 5

      t.timestamps
    end
  end
end
