class AddRangeToYourStock < ActiveRecord::Migration[7.0]
  def change
    add_column :your_stocks, :up_price, :string
    add_column :your_stocks, :down_price, :string
  end
end
