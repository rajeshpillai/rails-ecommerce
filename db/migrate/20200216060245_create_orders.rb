class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.bigint :user_id
      t.decimal :order_total

      t.timestamps
    end
  end
end
