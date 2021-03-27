class OtherUsersController < ApplicationController
  def index
    @other_users = User.all
  end

  def show
    @other_user = User.find(params[:id])
    @shared_goals = @other_user.goals.where(share: '公開')
  end
end
