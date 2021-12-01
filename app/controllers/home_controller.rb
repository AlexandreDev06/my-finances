class HomeController < ApplicationController
  def index
    @expenses = current_user.expenses.order(payment_at: :desc)
    @credits = current_user.credits.order(payment_at: :desc)
    @total_balance = @credits.balance.sum { |c| c.payment_at <= Date.current ? c.total : 0 } - @expenses.balance.sum { |e| e.payment_at <= Date.current ? e.total : 0 }
  end
end
