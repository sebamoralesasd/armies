class CreateTrainings < ActiveRecord::Migration[8.1]
  def change
    create_table :trainings do |t|
      t.string :unit_type, null: false
      t.integer :points, null: false
      t.integer :cost, null: false

      t.timestamps
    end
  end
end
