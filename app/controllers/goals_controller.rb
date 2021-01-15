class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]


  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
    @goal.problems.build
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
    @goal.destroy
    redirect_to goals_path, notice: '削除されました'
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :day_to_start, :day_to_finish, :purpose, :status, :when_succeed, :when_fail)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
