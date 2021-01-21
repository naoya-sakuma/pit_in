class WeeklyPlansController < ApplicationController
  def index
    @goals = current_user.goals.where(status: '着手中')
    # @goals.each do |goal|
    #   @problems = goal.problems
    #   @problems.each do |problem|
    #     @solutions = problem.solutions.where(working: '取組中')
    #   end
    # end
  end

  def weekly_update
    @goals = current_user.goals.where(status: '着手中')
    @goals.each do |goal|
      @problems = goal.problems
      @problems.each do |problem|
        @solutions = problem.solutions
        @solutions.each do |solution|
          solution.update(done_check)
          @tasks = solution.tasks
          @tasks.each do |task|
            task.update(make_plan_params)
          end
        end
      end
    end
    redirect_to weekly_plans_path, notice: '保存されました'
  end

  private
  def make_plan_params
    params.permit(:working, :done)
  end

  def done_check
    params.permit(:done)
  end
end
