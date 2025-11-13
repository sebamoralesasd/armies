class CreateEvolutions < ActiveRecord::Migration[8.1]
  def change
    create_table :evolutions do |t|
      t.string :init_unit_type, null: false
      t.string :final_unit_type, null: false
      t.integer :cost, null: false

      t.timestamps
    end
  end
end
