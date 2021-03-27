class OtherUsersController < ApplicationController
  def index
    @other_users = User.all
  end

  def show
    @other_user = User.find(params[:id])
  end
end
