class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  PER = 4

  def index
    @goals = current_user.goals.page(params[:page]).per(PER)

    respond_to do |format|
      format.html
      format.csv {send_data @goals.generate_csv, filename: "goals-#{Time.zone.now.strftime('%y%m%d%s')}.csv"}
    end
  end

  def new
    @goal = Goal.new
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
                                 problems_attributes: [:title, :_destroy, :id,
                                 solutions_attributes:[:title, :_destroy, :id,
                                 tasks_attributes:    [:title, :_destroy, :id,
                                 steps_attributes:    [:title, :_destroy, :id]]]])
  end

  def update_goal_params
    params.require(:goal).permit(:title, :day_to_start, :day_to_finish, :purpose, :status, :when_succeed, :when_fail,
                                 problems_attributes: [:title, :_destroy, :id,
                                 solutions_attributes:[:title, :_destroy, :id,
                                 tasks_attributes:    [:title, :_destroy, :id,
                                 steps_attributes:    [:title, :_destroy, :id]]]])
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
