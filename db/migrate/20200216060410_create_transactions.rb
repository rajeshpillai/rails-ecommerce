class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.bigint :order_id
      t.datetime :tran_date
      t.numeric :processor
      t.decimal :amount

      t.timestamps
    end
  end
end
