class CreateBattles < ActiveRecord::Migration[8.1]
  def change
    create_table :battles do |t|
      t.references :attacker_army, null: false, foreign_key: { to_table: :armies }
      t.references :defender_army, null: false, foreign_key: { to_table: :armies }
      t.references :winner, foreign_key: { to_table: :armies }
      t.string :result, null: false
      t.integer :winner_prize, null: false
      # TODO: draw and loser criteria

      t.timestamps
    end
  end
end
