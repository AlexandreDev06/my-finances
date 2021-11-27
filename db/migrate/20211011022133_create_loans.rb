class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.string :name
      t.float :value
      t.string :description
      t.date :date_payment
      t.integer :installment
      t.integer :percentage

      t.timestamps
    end
  end
end
