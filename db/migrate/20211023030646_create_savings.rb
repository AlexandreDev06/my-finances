class CreateSavings < ActiveRecord::Migration[6.1]
  def change
    create_table :savings do |t|
      t.float :profit
      t.float :balance
      t.float :income_tax
      t.float :iof

      t.timestamps
    end
  end
end
