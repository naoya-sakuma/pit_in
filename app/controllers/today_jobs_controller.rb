class TodayJobsController < ApplicationController
  before_action :set_goal, only: [:edit, :update, :destroy]

  def index
    @goals = current_user.goals.where(status: '取組中')
  end

  def edit
  end

  def update
    if @goal.update(today_job_params)
      redirect_to edit_today_job_path, notice: '変更が保存されました'
    else
      render :edit
    end
  end

  private
  def today_job_params
    params.require(:goal).permit(:_destroy, :id,
                                 problems_attributes: [:done, :_destroy, :id,
                                 solutions_attributes:[:_destroy, :id,
                                 tasks_attributes:    [:_destroy, :id,
                                 steps_attributes:    [:done, :_destroy, :id,]]]])
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
