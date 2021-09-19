class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[edit update destroy]

  def index
    @expenses = Expense.order :create_at
  end

  def new
    @expense = Expense.new
    @users = User.all
  end

  def create
    @expense = Expense.new values
    if @expense.save!
      redirect_to root_path, notice: "Despesa Criada"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @expense.update values
      redirect_to expenses_path, notice: "Despesa Atualizada"
    else
      render :edit
    end
  end

  def destroy
    if @expense.destroy
      redirect_to expenses_path, notice: "Despesa destruida"
    else
      render :index
    end
  end

  private

  def values
    params.require(:expense).permit!
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end
end
