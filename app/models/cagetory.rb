class Cagetory < ApplicationRecord
  has_many :words dependent: :destroy
  has_many :lessons dependent: :destroy
  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
