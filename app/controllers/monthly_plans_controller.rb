class MonthlyPlansController < ApplicationController
  def index
    @goals = current_user.goals.where(status: '着手中')
  end

  def monthly_update
    @goals = current_user.goals.where(status: '着手中')
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
    redirect_to monthly_path, notice: '保存されました'
  end
end
