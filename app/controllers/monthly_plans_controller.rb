class MonthlyPlansController < ApplicationController
  def index
    @goals = current_user.goals.where(status: '取組中')
  end

  def monthly_update
    @goals = current_user.goals.where(status: '取組中')
    @goals.each do |goal|
      @problems = goal.problems
      @problems.each do |problem|
        problem.update(done_check)
        @solutions = problem.solutions
        @solutions.each do |solution|
          solution.update(make_plan_params)
        end
      end
    end
    redirect_to monthly_plans_path, notice: '保存されました'
  end

  private
  def make_plan_params
    params.require(:problems).permit(:done, :_destroy, :id,
                                     solutions_attributes:[:working, :done, :_destroy, :id,])
  end

  def done_check
    params.require(:problems).permit(:done, :_destroy, :id)
  end
end
