class Category < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :words, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.max_name_category},
    uniqueness: {case_sensitive: false}
  scope :order_by_category, -> {order(created_at: :desc)}

  def base_resource
    text_show = "#{name}"
  end
end
