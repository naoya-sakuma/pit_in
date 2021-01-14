class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :solutions do |t|
      t.string :title
      t.date :day_to_start
      t.date :day_to_finish
      t.string :status
      t.references :problem, foreign_key: true

      t.timestamps
    end
  end
end
