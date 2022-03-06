class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :description
      t.float :total
      t.date :payment_at
      t.references :user, null: false, foreign_key: true


      t.timestamps
    end
  end
end
