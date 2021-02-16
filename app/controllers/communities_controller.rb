class CommunitiesController < ApplicationController
  before_action :set_community, only: [:edit, :update, :show, :destroy]
  before_action :set_search, only:[:index, :search]

  def index
    @communities = Community.all.page(params[:page]).per(10)
  end

  def new
    @community = Community.new
  end

  def create
    @community = current_user.communities.build(community_params)
    if @community.save
      redirect_to community_management_communities_path, notice: 'コミュニティが作成されました'
    else
      render :new
    end
  end

  def show
    @comments = @community.comments.page(params[:page]).per(10)
    @comment = @community.comments.build
    @member = current_user.members.find_by(community_id: @community.id)
  end

  def update
    if @community.update(community_params)
      redirect_to community_management_communities_path, notice: '変更が保存されました'
    else
      render :edit
    end
  end

  def destroy
    @community.destroy
    redirect_to community_management_communities_path, notice: '削除されました'
  end

  def search
    @searched_results_communities = @searched_communities.result.page(params[:page]).per(10)
  end

  def management
    @own_communities = Community.where(user_id: current_user.id)
    @other_communities = Community.where.not(user_id: current_user.id)
  end

  private

  def community_params
    params.require(:community).permit(:title, :summary)
  end

  def set_community
    @community = Community.find(params[:id])
  end

  def set_search
    @communities = Community.all
    @searched_communities = @communities.ransack(params[:q])
  end
end
