class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.bigint :product_id
      t.bigint :user_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
