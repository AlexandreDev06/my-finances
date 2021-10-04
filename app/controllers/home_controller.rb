class HomeController < ApplicationController
  def index
    @expenses = Expense.all
    @user = User.first
    @credits = Credit.all
    @future_goals = FutureGoal.all
    @total_expense = @expenses.sum { |e| e.total }
    @total_credit = @credits.sum { |c| c.total }
    @users = User.order :created_at
    @total_balance = @total_credit - @total_expense
    @total_savings = @credits.saving.sum { |c| c.total } - @expenses.saving.sum { |e| e.total }
    @total_future = @future_goals.sum { |f| f.total }
  end
end
