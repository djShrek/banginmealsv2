class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.string :order_item_ref
      t.string :title
      t.string :product_ref
      t.string :variant_ref
      t.string :variant_title
      t.string :variant_name
      t.integer :order_id
      t.jsonb :data

      t.timestamps
    end
  end
end
