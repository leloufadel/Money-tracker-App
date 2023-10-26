class CreateCategoryPurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :category_purchases do |t|
      t.references :category, null: false, foreign_key: true
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end

    add_index :category_purchases, [:purchase_id, :category_id], unique: true
  end
end
