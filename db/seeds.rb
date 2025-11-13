# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[ 'pikeman', 'archer', 'knight' ].each do |name|
  UnitType.find_or_create_by!(name:)
end


[ 'chinese', 'britons', 'byzantines' ].each do |name|
  Civilization.find_or_create_by!(name:)
end

CivilizationUnitType.find_or_create_by!(
  unit_type: UnitType.find_by!(name: 'pikeman'),
  civilization: Civilization.find_by!(name: 'chinese'),
  amount: 2
)

CivilizationUnitType.find_or_create_by!(
  unit_type: UnitType.find_by!(name: 'pikeman'),
  civilization: Civilization.find_by!(name: 'britons'),
  amount: 10
)

CivilizationUnitType.find_or_create_by!(
  unit_type: UnitType.find_by!(name: 'pikeman'),
  civilization: Civilization.find_by!(name: 'byzantines'),
  amount: 5
)

CivilizationUnitType.find_or_create_by!(
  unit_type: UnitType.find_by!(name: 'archer'),
  civilization: Civilization.find_by!(name: 'chinese'),
  amount: 25
)

CivilizationUnitType.find_or_create_by!(
  unit_type: UnitType.find_by!(name: 'archer'),
  civilization: Civilization.find_by!(name: 'britons'),
  amount: 10
)

CivilizationUnitType.find_or_create_by!(
  unit_type: UnitType.find_by!(name: 'archer'),
  civilization: Civilization.find_by!(name: 'byzantines'),
  amount: 8
)

CivilizationUnitType.find_or_create_by!(
  unit_type: UnitType.find_by!(name: 'knight'),
  civilization: Civilization.find_by!(name: 'chinese'),
  amount: 2
)

CivilizationUnitType.find_or_create_by!(
  unit_type: UnitType.find_by!(name: 'knight'),
  civilization: Civilization.find_by!(name: 'britons'),
  amount: 10
)

CivilizationUnitType.find_or_create_by!(
  unit_type: UnitType.find_by!(name: 'knight'),
  civilization: Civilization.find_by!(name: 'byzantines'),
  amount: 15
)

[ 100, 1_000, 10_000 ].each do |coins|
  Civilization.all.each do |civilization|
    Army.find_or_create_by!(coins:, civilization:)
  end
end

armies_ids = Army.all.pluck('id')
unit_types_ids = UnitType.all.pluck('id')
(0..100).each do |_i|
  Unit.find_or_create_by!(
    unit_type_id: unit_types_ids.sample,
    years_of_life: rand(0..100),
    force_points: rand(0..100),
    army_id: armies_ids.sample
  )
end

Training.find_or_create_by!(
  unit_type: UnitType.find_by!(name: 'pikeman'),
  points: 3,
  cost: 10
)

Training.find_or_create_by!(
  unit_type: UnitType.find_by!(name: 'archer'),
  points: 7,
  cost: 20
)

Training.find_or_create_by!(
  unit_type: UnitType.find_by!(name: 'knight'),
  points: 10,
  cost: 30
)

Evolution.find_or_create_by!(
  init_unit_type: UnitType.find_by!(name: 'pikeman'),
  final_unit_type: UnitType.find_by!(name: 'archer'),
  cost: 30
)

Evolution.find_or_create_by!(
  init_unit_type: UnitType.find_by!(name: 'archer'),
  final_unit_type: UnitType.find_by!(name: 'knight'),
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
