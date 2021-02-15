class CommunitiesController < ApplicationController
  def index
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
  end

  def destroy
  end

  def shoe
  end

  private

  def community_params
    params.require(:community).permit(:title, :summary)
  end
end
