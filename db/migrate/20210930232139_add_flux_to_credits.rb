class AddFluxToCredits < ActiveRecord::Migration[6.1]
  def change
    add_column :credits, :flux, :integer, default: 0
  end
end
