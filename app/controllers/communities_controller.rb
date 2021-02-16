class CommunitiesController < ApplicationController
  before_action :set_community, only: [:edit, :update, :show, :destroy]
  before_action :set_search, only:[:index, :search]

  def index
    @communities = Community.all
  end

  def new
    @community = Community.new
  end

  def create
    @community = current_user.communities.build(community_params)
    if @community.save
      redirect_to communities_path, notice: '目標が保存されました'
    else
      render :new
    end
  end

  def show
    @comments = @community.comments
    @comment = @community.comments.build
    @member = current_user.members.find_by(community_id: @community.id)
  end

  def update
    if @community.update(community_params)
      redirect_to communities_path, notice: '変更が保存されました'
    else
      render :edit
    end
  end

  def destroy
    @community.destroy
    redirect_to communities_path, notice: '削除されました'
  end

  def search
    @searched_results_communities = @searched_communities.result
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
