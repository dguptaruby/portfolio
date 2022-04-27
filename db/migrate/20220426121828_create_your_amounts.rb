class CreateYourAmounts < ActiveRecord::Migration[7.0]
  def change
    create_table :your_amounts do |t|
      t.string :amount

      t.timestamps
    end
  end
end
