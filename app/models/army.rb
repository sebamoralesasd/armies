class Army < ApplicationRecord
  belongs_to :civilization
  has_many :battles
  has_many :units

  validates :coins, presence: true, numericality: { greater_or_equal_to: 0 }

  def points
    units.sum(:force_points)
  end
end
