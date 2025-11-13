class Evolution < ApplicationRecord
  has_many :evolutions_histories

  validates :init_unit_type, :final_unit_type, presence: true, inclusion: { in: Unit::UNIT_TYPES }

  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
