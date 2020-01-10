class Project < ApplicationRecord
  belongs_to :user
  # default_scope -> { order (created_at: :desc)}
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: {minimum: 10, maximum: 50}
  validates :description, presence: true, length: {minimum: 1, maximum: 20}
  validates :img, presence: true
end
