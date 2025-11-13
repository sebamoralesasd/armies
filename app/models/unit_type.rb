class UnitType < ApplicationRecord
  has_many :civilization_unit_types

  validates :name, presence: true
end
