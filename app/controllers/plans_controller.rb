class PlansController < ApplicationController
  def montly
    # statusカラムが「着手中」の目標のみを取り出す
    @goals = current_user.goals.where(status: '着手中')
  end

  def weekly
  end

  def daily
  end
end
