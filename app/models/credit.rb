class Credit < ApplicationRecord
  enum flux: [:balance, :saving]

  def self.total_credit
    Credit.all.sum { |c| c.payment_at.month == Date.current.month ? c.total : 0 }
  end

  def self.total_credit_savings
    Credit.all.saving.sum { |c| c.total } - Expense.all.saving.sum { |e| e.total }
  end
end
