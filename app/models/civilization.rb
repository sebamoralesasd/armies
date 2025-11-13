class Civilization < ApplicationRecord
  has_many :armies

  validates :name, presence: true, uniqueness: true
end
