class HomeController < ApplicationController
  def index
    @expenses = Expense.all
    @user = User.first
    @credits = Credit.all
    @total_expense = @expenses.sum { |e| e.total }
    @total_credit = @credits.sum { |c| c.total }
  end
end
