# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[ 'chinese', 'britons', 'byzantines' ].each do |name|
  Civilization.find_or_create_by!(name:, init_config: { pikeman: 1, archer: 1, knight: 1 })
end

[ 100, 1_000, 10_000 ].each do |coins|
  Civilization.all.each do |civilization|
    Army.find_or_create_by!(coins:, civilization:)
  end
end

armies_ids = Army.all.pluck('id')
(0..100).each do |_i|
  Unit.find_or_create_by!(
    unit_type: Unit::UNIT_TYPES.sample,
    years_of_life: rand(0..100),
    force_points: rand(0..100),
    army_id: armies_ids.sample
  )
end

Training.find_or_create_by!(
  unit_type: 'pikeman',
  points: 3,
  cost: 10
)

Training.find_or_create_by!(
  unit_type: 'archer',
  points: 7,
  cost: 20
)

Training.find_or_create_by!(
  unit_type: 'knight',
  points: 10,
  cost: 30
)

Evolution.find_or_create_by!(
  init_unit_type: 'pikeman',
  final_unit_type: 'archer',
  cost: 30
)

Evolution.find_or_create_by!(
  init_unit_type: 'archer',
  final_unit_type: 'knight',
  cost: 40
)

(0..10).each do |_i|
  attacker_army_id = armies_ids.sample
  defender_army_id = (armies_ids - [ attacker_army_id ]).sample
  Battle.find_or_create_by!(
    attacker_army_id:,
    defender_army_id:,
    winner_prize: 100
  )
end
