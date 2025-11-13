class CreateUnits < ActiveRecord::Migration[8.1]
  def change
    create_table :units do |t|
      t.string :unit_type, null: false
      t.integer :years_of_life, null: false
      t.integer :force_points, null: false
      t.references :army, null: false, foreign_key: true

      t.timestamps
    end
  end
end
