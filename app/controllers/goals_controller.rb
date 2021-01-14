class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]


  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      redirect_to goals_path, notice: '目標が保存されました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to goals_path, notice: '変更が保存されました'
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :term, :purpose, :status, :when_succeed, :when_fail)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
