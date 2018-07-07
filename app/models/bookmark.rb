class Bookmark < ApplicationRecord
  belongs_to :topic

  validates :url, length: { minimum: 8 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true
end
