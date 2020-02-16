class CreateCategorizations < ActiveRecord::Migration[6.0]
  def change
    create_table :categorizations do |t|
      t.bigint :category_id
      t.bigint :product_id

      t.timestamps
    end
  end
end
