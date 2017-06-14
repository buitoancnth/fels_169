class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :lesson_words, dependent: :destroy
  has_many :words, through: :lesson_words, dependent: :destroy
  has_many :answers, through: :lesson_words, dependent: :destroy
  scope :user_start, -> user_id {where user_id: user_id}
  accepts_nested_attributes_for :lesson_words
  before_create :create_words

  private

  def create_words
    self.words = self.category.words.order("RANDOM()").limit 10
  end

end
