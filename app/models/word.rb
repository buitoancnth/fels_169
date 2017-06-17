class Word < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :lesson_words
  validates :content, presence: true
  accepts_nested_attributes_for :answers, allow_destroy: true
  scope :all_word, -> user_id {}
  scope :learned, -> user_id do
    where "id in (select word_id from answers where
      is_correct = 't' and id in (select answer_id from lesson_words where
        lesson_id in (select id from lessons where user_id = #{user_id})))"
  end
  scope :no_learn, -> user_id do
    where "id not in (select word_id from answers where
      is_correct = 't' and id in (select answer_id from lesson_words where
        lesson_id in (select id from lessons where user_id = #{user_id})))"
  end
end
