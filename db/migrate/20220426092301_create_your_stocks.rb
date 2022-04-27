class CreateYourStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :your_stocks do |t|
      t.string :stock_symbol
      t.string :buy_price
      t.string :sell_price
      t.boolean :holding, default: false
      t.timestamps
    end
  end
end
