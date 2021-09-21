class CreditsController < ApplicationController
  before_action :set_credit, only: [:edit, :update, :destroy]

  def index
    @credits = Credit.order :create_at
  end

  def new
    @credit = Credit.new
    @users = User.all
  end

  def create
    @credit = Credit.new values
    if @credit.save
      redirect_to root_path, notice: "Entrada cadastrada"
    else
      render :new
    end
  end

  def edit
    @users = User.all
  end

  def update
    if @credit.update values
      redirect_to credits_path, notice: "Entrada Atualizada"
    else
      render :edit
    end
  end

  def destroy
    if @credit.destroy
      redirect_to credits_path, notice: "Entrada deletada"
    else
      render :index
    end
  end

  private

  def values
    params.require(:credit).permit!
  end

  def set_credit
    @credit = Credit.find(params[:id])
  end
end
