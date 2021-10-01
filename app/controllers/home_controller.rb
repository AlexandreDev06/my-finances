class HomeController < ApplicationController
  def index
    @expenses = Expense.all
    @user = User.first
    @credits = Credit.all
    @total_expense = @expenses.sum { |e| e.total }
    @total_credit = @credits.sum { |c| c.total }
    @users = User.order :created_at
    @total_balance = @credits.balance.sum { |c| c.total } - @expenses.balance.sum { |e| e.total }
    @total_savings = @credits.saving.sum { |c| c.total } - @expenses.saving.sum { |e| e.total }
  end
end
