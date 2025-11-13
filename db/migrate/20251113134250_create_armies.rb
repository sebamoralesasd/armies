class CreateArmies < ActiveRecord::Migration[8.1]
  def change
    create_table :armies do |t|
      t.integer :coins, null: false, default: 1_000
      t.references :civilization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
