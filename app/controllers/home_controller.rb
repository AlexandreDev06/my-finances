class HomeController < ApplicationController
  def index
    @expenses = Expense.all
    @user = User.first
    @credits = Credit.all
    @future_goals = FutureGoal.all
    @total_expense = @expenses.sum { |e| e.payment_at.month == Date.current.month ? e.total : 0 }
    @total_credit = @credits.sum { |c| c.payment_at.month == Date.current.month ? c.total : 0 }
    @users = User.order :created_at
    @total_balance = @credits.sum { |c| c.total } - @expenses.sum { |e| e.total }
    @total_savings = @credits.saving.sum { |c| c.total } - @expenses.saving.sum { |e| e.total }
    @total_future = @future_goals.sum { |f| f.total }
  end
end
