class CreateProductVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :product_variants do |t|
      t.integer :product_id
      t.string :title
      t.integer :product_variant_ref
      t.integer :order_item_id
      t.jsonb :data

      t.timestamps
    end
  end
end
