class CivilizationUnitType < ApplicationRecord
  belongs_to :unit_type
  belongs_to :civilization

  validates :amount, presence: true, numericality: { greater_than: 0 }
end
