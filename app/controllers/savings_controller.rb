class SavingsController < ApplicationController
  before_action :set_saving, only: [:edit, :update]

  def index
    if Saving.first.nil?
      redirect_to new_saving_path
    end
    @saving = current_user.savings.first
  end

  def new
    @saving = Saving.new
  end

  def create
    @saving = Saving.new values
    if @saving.save
      redirect_to savings_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @saving.update values
      redirect_to savings_path
    else
      render :edit
    end
  end

  private

  def values
    params.require(:saving).permit!
  end

  def set_saving
    @saving = Saving.find(params[:id])
  end
end
