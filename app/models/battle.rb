class Battle < ApplicationRecord
  belongs_to :attacker_army, class_name: "Army"
  belongs_to :defender_army, class_name: "Army"
  belongs_to :winner, optional: true, class_name: "Army"

  validates :result, :winner_prize, presence: true

  validates :winner_prize, numericality: { greater_than_or_equal_to: 0 }
  validates :result, inclusion: { in: %w[attacker defender draw] }

  validate :armies_loop

  before_validation :define_result, on: :create

  def define_result
    attacker_points = attacker_army.points
    defender_points = defender_army.points

    if attacker_points == defender_points
      self.result = "draw"
      return
    end

      if attacker_points > defender_points
        self.result = "attacker"
        self.winner = attacker_army
      else
        self.result = "defender"
        self.winner = defender_army
      end
  end

  def armies_loop
    return unless attacker_army == defender_army

    errors.add(:model, "army_cant_attack_itself")
  end

  def winner
    return nil if result == "draw"

    result == "attacker" ? attacker_army : defender_army
  end
end
