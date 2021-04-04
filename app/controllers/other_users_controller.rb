class OtherUsersController < ApplicationController
  def index
    @other_users = User.all.where.not(id: current_user.id)
  end

  def show
    @other_user = User.find(params[:id])
    @shared_goals = @other_user.goals.where(share: '公開')
    @own_communities = @other_user.communities
  end
end
