class TodayJobsController < ApplicationController
  before_action :check_logged_in

  def index
    @goals = current_user.goals.where(status: '取組中')
    @goals.each do |goal|
      @problems = goal.problems
    end
  end
end
