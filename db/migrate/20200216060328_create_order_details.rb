class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.bigint :order_id
      t.bigint :product_id
      t.string :sku
      t.decimal :unit_price
      t.numeric :quantity
      t.decimal :sub_total

      t.timestamps
    end
  end
end
