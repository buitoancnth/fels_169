class Answer < ApplicationRecord
  belongs_to :word
  has_many :lesson_words
  validates :content, presence: true, length: {maximum: Settings.max_content}

  scope :correct, ->{where is_correct: true}

  def base_resource
    "#{self.content}|#{self.word.base_resource}"
  end

end
