class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :lesson_words, dependent: :destroy
  has_many :words, through: :lesson_words, dependent: :destroy
  has_many :answers, through: :lesson_words, dependent: :destroy
  scope :user_start, -> user_id {where user_id: user_id}
  accepts_nested_attributes_for :lesson_words
  before_create :create_words

  scope :user_start, -> user_id {where user_id: user_id}
  scope :activities_by, -> user_id {where user_id: user_id}

  private

  def base_resource
    if is_learned
      text_show = "\" lesson #{id} \" of category: \"#{category.name}\""
      text_show = "#{answers.correct.size}/#{answers.size} words in #{text_show}"
    else
      text_show = "\" lesson #{id} \" of category: \"#{category.name}\""
    end
  end

  def create_words
    self.words = self.category.words.order("RANDOM()").limit Settings.size_words
  end

end
