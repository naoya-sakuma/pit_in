class MonthlyPlansController < ApplicationController
  def index
    @goals = current_user.goals.where(status: '取組中')
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    if @goal.update(update_goal_params)
      redirect_to monthly_plan_path, notice: '変更が保存されました'
    else
      render :edit
    end
  end

  private
  def update_goal_params
    params.require(:goal).permit(problems_attributes: [:working, :done, :_destroy, :id,
                                 solutions_attributes:[:working, :done, :_destroy, :id]])
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
