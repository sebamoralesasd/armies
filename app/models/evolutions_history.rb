class EvolutionsHistory < ApplicationRecord
  belongs_to :evolution
  belongs_to :unit
end
