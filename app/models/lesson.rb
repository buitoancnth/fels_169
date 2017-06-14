class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :words, through: :lesson_words, dependent: :destroy
  has_many :answers, through: :lesson_words, dependent: :destroy
  scope :user_start, -> user_id {where user_id: user_id}
end
