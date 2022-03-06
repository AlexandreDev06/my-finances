class Expense < ApplicationRecord
  enum flux: [:balance, :saving]
  belongs_to :user
  
  def self.total_expense
    all.sum { |e| e.payment_at.month == Date.current.month && e.payment_at.day <= Date.current.day ? e.total : 0 }
  end

  def self.total_credit
    all.sum { |c| c.payment_at.month == Date.current.month && c.payment_at.day <= Date.current.day ? c.total : 0 }
  end

end
