class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]


  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
    @problem = Problem.new
    @solution = Solution.new
    @task = Task.new
    @problem = @goal.problems.build
    @solution = @problem.solutions.build
    @task = @solution.tasks.build
    @step = @task.steps.build
  end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      redirect_to goals_path, notice: '目標が保存されました'
    else
      render :new
    end
  end

  def show
  end

  def edit
    saved_problems = @goal.problems.count
    saved_problems + 1.times { @goal.problems.build }

    @problems = @goal.problems
    @problems.each do |p|
      saved_solutions = p.solutions.count
      saved_solutions + 1.times { p.solutions.build }

      @solutions = p.solutions
      @solutions.each do |s|
        saved_tasks = s.tasks.count
        saved_tasks + 1.times { s.tasks.build }

        @tasks = s.tasks
        @tasks.each do |t|
          saved_steps = t.steps.count
          saved_steps + 1.times { t.steps.build }
        end
    end
  end
end

  def update
    if @goal.update(update_goal_params)
      redirect_to goals_path, notice: '変更が保存されました'
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_path, notice: '削除されました'
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :day_to_start, :day_to_finish, :purpose, :status, :when_succeed, :when_fail,
                                 problems_attributes: [:title, :status,
                                 solutions_attributes:[:title, :status,
                                 tasks_attributes:    [:title, :status,
                                 steps_attributes:   [:title, :status]]]]
                               )
  end

  def update_goal_params
    params.require(:goal).permit(:title, :day_to_start, :day_to_finish, :purpose, :status, :when_succeed, :when_fail,
                                 problems_attributes: [:title, :status, :_destroy, :id,
                                 solutions_attributes:[:title, :status, :_destroy, :id,
                                 tasks_attributes:    [:title, :status, :_destroy, :id,
                                 steps_attributes:   [:title, :status, :_destroy, :id]]]]
                               )
  end

  def set_goal
    @goal = Goal.find(params[:id]) # @goal = 編集しようとしている目標1つ
    #@problems = @goal.problems # @problems = 編集しようとしている目標に紐づく問題達
    #@problems.each do |problem|
      #@solutions = problem.solutions
  end
end
