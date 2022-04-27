class AddQuantityToYourStocks < ActiveRecord::Migration[7.0]
  def change
    add_column :your_stocks, :quatity, :integer
  end
end
