class Unit < ApplicationRecord
  # UNIT_TYPES = %w[pikeman archer knight].freeze

  belongs_to :army
  belongs_to :unit_type
  has_many :evolutions_histories
  has_many :trainings_histories

  validates :years_of_life, :force_points, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
