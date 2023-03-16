class Cart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :friendly_url, :string              
  end
end
