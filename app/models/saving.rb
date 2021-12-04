class Saving < ApplicationRecord
  has_many :savings
  belongs_to :user

  def profit_annually(saving, current_user)
    (current_user.credits.total_credit_savings / 100) * saving.profit
  end

  def profit_monthly(saving, current_user)
    saving.profit_annually(saving, current_user) / 12
  end

  def profit_daily(saving, current_user)
    saving.profit_monthly(saving, current_user) / 30
  end
end
