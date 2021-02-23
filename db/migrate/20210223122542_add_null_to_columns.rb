class AddNullToColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_null :goals, :title, false
    change_column_null :solutions, :title, false
    change_column_null :tasks, :title, false
    change_column_null :steps, :title, false
    change_column_null :communities, :title, false
    change_column_null :communities, :user_id, false
    change_column_null :goals, :user_id, false
    change_column_null :problems, :goal_id, false
    change_column_null :solutions, :problem_id, false
    change_column_null :tasks, :solution_id, false
    change_column_null :steps, :task_id, false
    change_column_null :comments, :content, false
  end
end
