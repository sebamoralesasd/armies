class CreateUnitTypes < ActiveRecord::Migration[8.1]
  def change
    create_table :unit_types do |t|
      t.string :name, null: false

      t.timestamps
    end

    remove_column :units, :unit_type, :string
    add_reference :units, :unit_type, null: false, foreign_key: true
    remove_column :trainings, :unit_type, :string
    add_reference :trainings, :unit_type, null: false, foreign_key: true
    remove_column :evolutions, :init_unit_type, :string
    add_reference :evolutions, :init_unit_type, null: false, foreign_key: { to_table: :unit_types }
    remove_column :evolutions, :final_unit_type, :string
    add_reference :evolutions, :final_unit_type, null: false, foreign_key: { to_table: :unit_types }
  end
end
