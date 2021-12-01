class Expense < ApplicationRecord
  enum flux: [:balance, :saving]
  belongs_to :user
  
  def self.total_expense
    totaln = 0
    all.each { |e| e.payment_at.month == Date.current.month ? totaln += e.total : 0 }
    totaln
  end
end
