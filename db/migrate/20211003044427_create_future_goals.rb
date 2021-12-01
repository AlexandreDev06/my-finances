class CreateFutureGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :future_goals do |t|
      t.string :name
      t.string :description
      t.float :total
      t.integer :priority
      t.date :ending_date
      t.references :user, null: false, foreign_key: true


      t.timestamps
    end
  end
end
