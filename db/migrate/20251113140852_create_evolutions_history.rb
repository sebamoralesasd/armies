class CreateEvolutionsHistory < ActiveRecord::Migration[8.1]
  def change
    create_table :evolutions_histories do |t|
      t.references :unit, null: false, foreign_key: true
      t.references :evolution, null: false, foreign_key: true

      t.timestamps
    end
  end
end
