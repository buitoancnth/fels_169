class Answer < ApplicationRecord
  belongs_to :word
  has_many :lesson_words
  validates :content, presence: true, length: {maximum: Settings.max_content}

  scope :correct, ->{where is_correct: true}
end
