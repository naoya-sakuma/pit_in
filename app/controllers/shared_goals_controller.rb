class SharedGoalsController < ApplicationController
  def index
    @shared_goals = Goal.where(share: '公開')
  end
end
