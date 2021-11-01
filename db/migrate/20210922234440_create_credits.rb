class CreateCredits < ActiveRecord::Migration[6.1]
  def change
    create_table :credits do |t|
      t.string :name
      t.string :description
      t.float :total
      t.date :payment_at

      t.timestamps
    end
  end
end
