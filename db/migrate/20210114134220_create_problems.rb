class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.string :title, null: false
      t.string :status
      t.references :goal, foreign_key: true
      t.timestamps
    end
  end
end
