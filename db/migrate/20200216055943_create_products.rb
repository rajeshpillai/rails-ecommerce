class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :sku
      t.decimal :list_price
      t.string :type
      t.numeric :quantity
      t.numeric :status
      t.string :product_type
      t.timestamps
    end
  end
end
