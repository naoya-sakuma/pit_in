class CommunitiesController < ApplicationController
  before_action :set_community, only: [:edit, :update, :show]

  def index
    @communities = Community.all
    #@communities = Community.where.not(user_id: current_user.id)
    @own_communities = Community.where(user_id: current_user.id)
    #@joining_community =
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

  def update
    if @community.update(community_params)
      redirect_to communities_path, notice: '変更が保存されました'
    else
      render :edit
    end
  end

  def destroy
  end

  def show
    @comments = @community.comments
    @comment = @community.comments.build
  end

  private

  def community_params
    params.require(:community).permit(:title, :summary)
  end

  def set_community
    @community = Community.find(params[:id])
  end
end
