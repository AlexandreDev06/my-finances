class HomeController < ApplicationController
  def index
    @expenses = Expense.all
  end
end
