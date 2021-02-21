class MembersController < ApplicationController
  def create
    member = current_user.members.create(community_id: params[:community_id])
    redirect_to communities_url, notice: "「#{member.community.title}」に参加しました。"
  end

  def destroy
    member = current_user.members.find_by(id: params[:id]).destroy
    redirect_to communities_url, notice: "「#{member.community.title}」から退出しました"
  end
end
