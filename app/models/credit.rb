class Credit < ApplicationRecord
  belongs_to :user
  enum flux: [:balance, :saving]

  def self.total_credit
    totaln = 0
    Credit.all.each { |c| c.payment_at.month == Date.current.month ? totaln += c.total : 0 }
    totaln
  end
end
