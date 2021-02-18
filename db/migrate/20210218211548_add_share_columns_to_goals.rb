class AddShareColumnsToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :share, :string, default: "非公開"
  end
end
