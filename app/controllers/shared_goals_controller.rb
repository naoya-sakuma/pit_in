class SharedGoalsController < ApplicationController
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
end
