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
        @solutions.each do |solution|
          solution.update(make_plan_params)
        end
      end
    end
    redirect_to monthly_path, notice: '保存されました'
  end

  def weekly
    @goals = current_user.goals.where(status: '着手中')
    @goals.each do |goal|
      @problems = goal.problems
      @problems.each do |problem|
        @solutions = problem.solutions.where(working: '')
      end
    end
  end

  def weekly_update
  end

  def daily
    @goals = current_user.goals.where(status: '着手中')
    @goals.each do |goal|
      @problems = goal.problems
      @problems.each do |problem|
        @solutions = problem.solutions.where(working: '')
        @solutions.each do |solution|
          @tasks = solution.tasks.where(working: '')
        end
      end
    end
  end

  def daily_update
  end

  private
  def make_plan_params
    params.permit(:working, :done)
  end


end
