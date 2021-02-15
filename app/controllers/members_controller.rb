class MembersController < ApplicationController
  def create
    member = current_user.members.create(community_id: params[:community_id])
    redirect_to communities_url, notice: "#{member.community.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    member = current_user.members.find_by(id: params[:id]).destroy
    redirect_to communities_url, notice: "#{member.community.user.name}さんのブログをお気に入り解除しました"
  end
end
