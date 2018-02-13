class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :order_item_ref
      t.string :title
      t.integer :product_ref
      t.integer :variant_ref
      t.string :variant_title
      t.string :variant_name
      t.integer :order_id
      t.jsonb :data

      t.timestamps
    end
  end
end
