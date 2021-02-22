class DailyPlan
  attr_accessor :goals

  def initialize(goal)
    @goals = goals
  end

  def tasks
    @goals.where(status: '取組中').tasks
  end
end
