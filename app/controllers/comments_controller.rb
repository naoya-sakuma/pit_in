class CommentsController < ApplicationController
  def create

    @community = Community.find(params[:community_id])
    @comment = @community.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to community_path(@community) }
      else
        format.html { redirect_to community_path(@community), notice: '投稿できませんでした...' }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:community_id, :content)
  end
end
