class SharedGoalsController < ApplicationController
  before_action :set_search, only:[:index, :search]

  def index
    @shared_goals = Goal.where(share: '公開')
  end

  def update
    @taked_in_goal = Goal.find(params[:id])
    @goal_to_be_added = @taked_in_goal.deep_clone include: [problems: [solutions: [tasks: :steps]]]
    @goal_to_be_added.update(user_id: current_user.id)
    @goal_to_be_added.update(share: "非公開")
    @goal_to_be_added.user.update(nickname: current_user.nickname)
    redirect_to goals_path, notice: '目標を追加しました'
  end

  def search
    @searched_results_goals = @searched_goal.result
  end

  private
  def set_search
    @shared_goals = Goal.where(share: '公開')
    @searched_goal = @shared_goals.ransack(params[:q])
    @searched_word = params.permit(:title)
  end
end
