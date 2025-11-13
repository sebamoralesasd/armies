class Army < ApplicationRecord
  belongs_to :civilization
  has_many :attacker_battles, class_name: "Battle", foreign_key: "attacker_army_id"
  has_many :defender_battles, class_name: "Battle", foreign_key: "defender_army_id"

  def battles
    Battle.where("attacker_army_id = :id OR defender_army_id = :id", id: self.id)
  end

  has_many :units

  validates :coins, presence: true, numericality: { greater_or_equal_to: 0 }

  def points
    units.sum(:force_points)
  end
end
