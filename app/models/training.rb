class Training < ApplicationRecord
  has_many :evolutions_histories

  validates :unit_type, :points, :cost, presence: true

  # NOTE: can we assume zero-cost/zero-point benefit?
  # validates :points, :cost, numericality: { greater_than_or_equal_to: 0 }
  validates :points, :cost, numericality: { greater_than_or_equal_to: 1 }

  validates :unit_type, inclusion: { in: Unit::UNIT_TYPES }
end
