class Word < ApplicationRecord
  belongs_to :cagetory
  has_many :answers dependent: :destroy
  has_many :lesson_words
end
