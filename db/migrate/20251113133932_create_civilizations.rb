class CreateCivilizations < ActiveRecord::Migration[8.1]
  def change
    create_table :civilizations do |t|
      t.string :name, null: false
      t.json :init_config, null: false

      t.timestamps
    end
  end
end
