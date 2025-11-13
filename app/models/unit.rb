class Unit < ApplicationRecord
  UNIT_TYPES = %w[pikeman archer knight].freeze

  belongs_to :army
  has_many :evolutions_histories
  has_many :trainings_histories

  validates :years_of_life, :force_points, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :unit_type,  presence: true, inclusion: { in: UNIT_TYPES }
end
