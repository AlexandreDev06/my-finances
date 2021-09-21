class CreateCredits < ActiveRecord::Migration[6.1]
  def change
    create_table :credits do |t|
      t.string :name
      t.float :total
      t.string :description
      t.date :payment_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
