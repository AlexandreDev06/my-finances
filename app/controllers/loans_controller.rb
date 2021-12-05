class LoansController < ApplicationController
  before_action :set_loan, only: [:edit, :update, :destroy]

  def index
    @loans = current_user.loans.all
  end

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new values
    if @loan.save!
      unless @loan.percentage == 0 
        Expense.new(name: "Emprestimo",
          description: "Emprestimo do #{@loan.name}",
          total: @loan.value,
          payment_at: @loan.date_payment,
          user_id: User.first.id,
          flux: 0).save!
      end
        @loan.installment.times do |time|
          Credit.new(name: "Juros",
                    description: "Juros de emprestimo do #{@loan.name}, Parcela N° #{time + 1}",
                    total: @loan.per_loan(@loan.percentage, @loan.value),
                    payment_at: @loan.date_payment.next_month(time),
                    user_id: User.first.id,
                    flux: 0).save!

        end
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
