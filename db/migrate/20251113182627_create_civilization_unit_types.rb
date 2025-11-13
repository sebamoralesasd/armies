class CreateCivilizationUnitTypes < ActiveRecord::Migration[8.1]
  def change
    create_table :civilization_unit_types do |t|
      t.references :civilization, null: false, foreign_key: true
      t.references :unit_type, null: false, foreign_key: true
      t.integer :amount, null: false

      t.timestamps
    end
    remove_column :civilizations, :init_config, :json
  end
end
