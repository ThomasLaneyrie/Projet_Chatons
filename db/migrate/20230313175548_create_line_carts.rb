class CreateLineCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :line_carts do |t|
      t.integer :quantity
      t.belongs_to :cart, index: true
      t.belongs_to :item, index: true
      t.timestamps
    end
  end
end

