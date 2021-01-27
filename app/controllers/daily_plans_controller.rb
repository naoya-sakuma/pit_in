class DailyPlansController < ApplicationController
  before_action :set_goal, only: [:edit, :update, :destroy]

  def index
    @goals = current_user.goals.where(status: '取組中')
  end

  def edit
  end

  def update
    if @goal.update(update_params)
      redirect_to edit_daily_plan_path, notice: '変更が保存されました'
    else
      render :edit
    end
  end

  private
  def update_params
    params.require(:goal).permit(:_destroy, :id,
                                 problems_attributes:  [:_destroy, :id,
                                 solutions_attributes: [:_destroy, :id,
                                 tasks_attributes:     [:working, :done, :_destroy, :id,
                                 steps_attributes:     [:working, :done, :_destroy, :id,]]]])
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
