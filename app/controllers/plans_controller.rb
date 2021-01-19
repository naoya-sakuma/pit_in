class PlansController < ApplicationController
  def montly
    @goals = current_user.goals.where(status: '着手中')
  end

  def weekly
  end

  def daily
  end
end
