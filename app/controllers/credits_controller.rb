class CreditsController < ApplicationController
  before_action :set_credit, only: [:edit, :update, :destroy]

  def index
    @credits = current_user.credits.order(payment_at: :desc)
  end

  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.new values
    if @credit.save
      redirect_to root_path
    else
      render :index
    end
  end

  def edit;end

  def update
    if @credit.update values
      redirect_to credits_path
    else
      render :edit
    end
  end

  def destroy
    if @credit.destroy
      redirect_to credits_path
    else
      render :index
    end
  end

  private

  def values
    params[:credit][:total].gsub!('.', '')
    params[:credit][:total].gsub!(',', '.')
    params.require(:credit).permit!
  end

  def set_credit
    @credit = Credit.find(params[:id])
  end
end
