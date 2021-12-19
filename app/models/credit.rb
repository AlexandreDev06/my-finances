class Credit < ApplicationRecord
  enum flux: [:balance, :saving]
  belongs_to :user

  def self.total_credit
    all.sum { |c| c.payment_at.month == Date.current.month && c.payment_at.day <= Date.current.day ? c.total : 0 }
  end

  def self.total_credit_savings(current_user)
    saving.sum { |c| c.total } - current_user.expenses.saving.sum { |e| e.total }
  end
end
