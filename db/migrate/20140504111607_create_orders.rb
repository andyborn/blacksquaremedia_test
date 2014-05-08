class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.float :vat_rate

      t.timestamps
    end
  end
end
