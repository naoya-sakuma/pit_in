# メインがtaskなのであればTasksControllerのほうが良いのかも
# DailyPlanというくくりで処理するのであれば、DailyPlanというモデルを扱うほうが自然かも
class DailyPlansController < ApplicationController
  before_action :check_logged_in
  before_action :set_goal, only: [:edit, :update]

  def index
    @goals = current_user.goals.where(status: '取組中')
    # daily_planというくくりで考える何らこんな感じのイメージ
    # @daily_plan = DailyPlan.new(current_user.goals)
  end

  def edit
  end

  def update
    if @goal.update(daily_plan_params)
      redirect_to daily_plans_path, notice: '変更が保存されました'
    else
      render :edit
    end
  end


  private
  def daily_plan_params
    params.require(:goal).permit(:_destroy, :id,
                                 problems_attributes:  [:_destroy, :id,
                                 solutions_attributes: [:_destroy, :id,
                                 tasks_attributes:     [:status, :_destroy, :id,
                                 steps_attributes:     [:status, :_destroy, :id,]]]])
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
