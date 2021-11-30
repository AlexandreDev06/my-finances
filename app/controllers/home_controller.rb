class HomeController < ApplicationController
  def index
    @expenses = Expense.all.order(payment_at: :desc)
    @credits = Credit.all.order(payment_at: :desc)
    @user = current_user
    @total_balance = @credits.balance.sum { |c| c.payment_at <= Date.current ? c.total : 0 } - @expenses.balance.sum { |e| e.payment_at <= Date.current ? e.total : 0 }
  end
end
