class CreateIsolatedSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :isolated_steps do |t|
      t.string :title
      t.string :status
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
