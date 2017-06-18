class Activity < ApplicationRecord
  belongs_to :user
  validates :antion_type, presence: true



end
