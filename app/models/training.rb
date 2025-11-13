class Training < ApplicationRecord
  has_many :evolutions_histories
  belongs_to :unit_type

  validates :points, :cost, presence: true

  # NOTE: can we assume zero-cost/zero-point benefit?
  # validates :points, :cost, numericality: { greater_than_or_equal_to: 0 }
  validates :points, :cost, numericality: { greater_than_or_equal_to: 1 }
end
