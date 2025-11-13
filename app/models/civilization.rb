class Civilization < ApplicationRecord
  has_many :armies

  validates :name, :init_config, presence: true
  validates :name, uniqueness: true
end
