class HomeController < ApplicationController
  def index
    @expenses = Expense.all
    @credits = Credit.all
    @total_balance = @credits.sum { |c| c.total } - @expenses.sum { |e| e.total }
    @total_savings = @credits.saving.sum { |c| c.total } - @expenses.saving.sum { |e| e.total }
  end
end
