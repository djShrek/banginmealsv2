class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_ref
      t.string :title
      t.string :handle
      t.text :options, array: true, default: []
      t.jsonb :data

      t.timestamps
    end
  end
end
