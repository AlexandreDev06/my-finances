class HomeController < ApplicationController
  def index
    @expenses = Expense.all
    @credits = Credit.all
    @total_balance = @credits.sum { |c| c.payment_at <= Date.current ? c.total : 0 } - @expenses.sum { |e| e.payment_at <= Date.current ? e.total : 0 }
  end
end
