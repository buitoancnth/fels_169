class Activity < ApplicationRecord
  belongs_to :user
  validates :content_action, presence: true

  scope :order_by_activity, -> {order(created_at: :desc)}
  scope :activities_by, -> user_id{where "user_id = #{user_id}"}
end
