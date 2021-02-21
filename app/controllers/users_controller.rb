class UsersController < ApplicationController
  before_action :check_logged_in

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: I18n.t('views.messages.update_profile')
    else
      render 'edit'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :nickname, :email, :introduction, :icon)
  end
end
