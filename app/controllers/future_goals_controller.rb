class FutureGoalsController < ApplicationController
  before_action :set_future_goal, only: [:edit, :update, :destroy]

  def index
    @future_goals = FutureGoal.order :priority
  end

  def new
    @future_goal = FutureGoal.new
  end

  def create
    @future_goal = FutureGoal.new values
    if @future_goal.save!
      redirect_to future_goals_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @future_goal.update values
      redirect_to future_goals_path
    else
      render :edit
    end
  end

  def destroy
    if @future_goal.destroy
      redirect_to future_goals_path
    else
      render :index
    end
  end

  private

  def values
    params.require(:future_goal).permit!
  end

  def set_future_goal
    @future_goal = FutureGoal.find(params[:id])
  end
end
