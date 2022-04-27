class CreateYourAmount < ActiveRecord::Migration[7.0]
  def up
    YourAmount.create(amount: "0.0")
  end

  def down
    YourAmount.delete_all
  end
end
