class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :cagetory
  has_many :words, through: :lesson_words, dependent: :destroy
  has_many :answers, through: :lesson_words, dependent: :destroy
end
