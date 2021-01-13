class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      redirect_to goals_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :term, :purpose, :status, :when_succeed, :when_fail)
  end
end
