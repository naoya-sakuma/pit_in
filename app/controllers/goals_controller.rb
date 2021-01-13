class GoalsController < ApplicationController
  def index
    @goal = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
