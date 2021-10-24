class Saving < ApplicationRecord
  has_many :savings

  def profit_annually(saving)
    (Credit.total_credit_savings / 100) * saving.profit
  end

  def profit_monthly(saving)
    saving.profit_annually(saving) / 12
  end

  def profit_daily(saving)
    saving.profit_monthly(saving) / 30
  end
end
