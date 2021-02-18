class CreateSharedGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :shared_goals do |t|
      t.string "title"
      t.date "day_to_start"
      t.string "purpose"
      t.string "status"
      t.text "when_succeed"
      t.text "when_fail"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.date "day_to_finish"
      t.string "share", default: "非公開"
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
