class DailyPlansController < ApplicationController
  def index
    @goals = current_user.goals.where(status: '着手中')
  end

  def daily_update
    @goals = current_user.goals.where(status: '着手中')
    @goals.each do |goal|
      @problems = goal.problems
      @problems.each do |problem|
        @solutions = problem.solutions
        @solutions.each do |solution|
          @tasks = solution.tasks
          @tasks.each do |task|
            task.update(done_check)
            @steps = task.steps
            @steps.each do |step|
              step.update(make_plan_params)
            end
          end
        end
      end
    end
    redirect_to daily_plans_path, notice: '保存されました'
  end

  private
  def make_plan_params
    params.permit(:working, :done)
  end

  def done_check
    params.permit(:done)
  end
end
