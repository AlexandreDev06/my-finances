class AddFluxToExpenses < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :flux, :integer, default: 0
  end
end
