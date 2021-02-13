class ProblemsController < ApplicationController
  before_action :check_logged_in
  before_action :set_goal, only: [:edit, :update]

  def index
    @goals = current_user.goals.where(status: '取組中')
  end

  def edit
  end

  def update
    if @goal.update(problem_edit_params)
      redirect_to problems_path, notice: '変更が保存されました'
    else
      render :edit
    end
  end

  private
  def problem_edit_params
    params.require(:goal).permit(:_destroy, :id,
                                 problems_attributes: [:status, :_destroy, :id,])
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
