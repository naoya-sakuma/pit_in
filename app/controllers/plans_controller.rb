class PlansController < ApplicationController
  def monthly
    @goals = current_user.goals.where(status: '着手中')
  end

  def monthly_update
    @goals = current_user.goals.where(status: '着手中')
    @goals.each do |goal|
      @problems = goal.problems
      @problems.each do |problem|
        @solutions = problem.solutions
        problem.update(make_plan_params)
        @solutions.each do |solution|
          solution.update(make_plan_params)
        end
      end
    end
    redirect_to monthly_path, notice: '保存されました'
  end

  def weekly
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
          @tasks = solution.tasks
          @tasks.each do |task|
            task.update(make_plan_params)
          end
        end
      end
    end
    redirect_to weekly_path, notice: '保存されました'
  end

  def daily
    @goals = current_user.goals.where(status: '着手中')
  end

  def daily_update

  end

  private
  def make_plan_params
    params.permit(:working, :done)
  end


end
