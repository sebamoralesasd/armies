class CreateTrainingsHistory < ActiveRecord::Migration[8.1]
  def change
    create_table :trainings_histories do |t|
      t.references :unit, null: false, foreign_key: true
      t.references :training, null: false, foreign_key: true

      t.timestamps
    end
  end
end
