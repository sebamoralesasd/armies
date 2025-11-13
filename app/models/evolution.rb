class Evolution < ApplicationRecord
  has_many :evolutions_histories

  belongs_to :init_unit_type, class_name: "UnitType"
  belongs_to :final_unit_type, class_name: "UnitType"

  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
