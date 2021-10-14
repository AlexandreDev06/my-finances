class LoansController < ApplicationController
  before_action :set_loan, only: [:edit, :update, :destroy]

  def index
    @loans = Loan.all
  end

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new values
    if @loan.save!
      redirect_to loans_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @loan.update values
      redirect_to loans_path
    else
      render :edit
    end
  end

  def destroy
    if @loan.destroy
      redirect_to loans_path
    else
      render :index
    end
  end

  private

  def values
    params.require(:loan).permit!
  end

  def set_loan
    @loan = Loan.find(params[:id])
  end
end
