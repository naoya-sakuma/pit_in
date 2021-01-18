class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title
      t.date :term
      t.string :purpose
      t.string :status
      t.text :when_succeed
      t.text :when_fail
      t.timestamps
    end
  end
end
