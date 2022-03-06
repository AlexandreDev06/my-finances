class Loan < ApplicationRecord
  belongs_to :user

  def per_loan(porcentage, value)
    value * (porcentage.to_f / 100)
  end
end
