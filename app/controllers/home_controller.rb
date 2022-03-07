class HomeController < ApplicationController
  def index
    @expenses = current_user.expenses.order(payment_at: :desc)
    @credits = current_user.credits.order(payment_at: :desc)
    @total_balance = @credits.balance.sum { |c| c.payment_at <= Date.current ? c.total : 0 } - @expenses.balance.sum { |e| e.payment_at <= Date.current ? e.total : 0 }
  end

  def investment
    @loans = current_user.loans
  end

  def reset_all
    current_user.expenses.each { |expense| expense.destroy }
    current_user.credits.each { |credit| credit.destroy }
    redirect_to root_path
  end
end
