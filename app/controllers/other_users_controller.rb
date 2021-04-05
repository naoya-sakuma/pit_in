class OtherUsersController < ApplicationController
  before_action :set_search, only:[:index, :search]

  def index
    @other_users = User.all.where.not(id: current_user.id).page(params[:page]).per(10)
  end

  def show
    @other_user = User.find(params[:id])
    @shared_goals = @other_user.goals.where(share: '公開')
    @own_communities = @other_user.communities
  end

  def search
    @searched_results_other_users = @searched_other_users.result.page(params[:page]).per(10)
  end

  private
  def set_search
    @other_users = User.all.where.not(id: current_user.id)
    @searched_other_users = @other_users.ransack(params[:q])
  end
end
