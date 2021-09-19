class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.float :balance
      t.float :savings

      t.timestamps
    end
  end
end
