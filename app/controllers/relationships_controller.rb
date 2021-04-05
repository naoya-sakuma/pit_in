class RelationshipsController < ApplicationController
  before_action :check_logged_in
  before_action :set_search, only:[:index, :search]

  def index
    @following_users = current_user.following
  end

  respond_to? :js
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
  end

  def search
    @searched_results_following_users = @searched_following_users.result.page(params[:page]).per(10)
  end

  private
  def set_search
    @following_users = current_user.following
    @searched_following_users = @following_users.ransack(params[:q])
  end

end
