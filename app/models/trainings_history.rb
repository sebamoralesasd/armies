class TrainingsHistory < ApplicationRecord
  belongs_to :training
  belongs_to :unit
end
