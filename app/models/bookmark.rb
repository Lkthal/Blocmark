class Bookmark < ApplicationRecord
  belongs_to :topic, optional: true
  belongs_to :user, optional: true
  validates :url, length: { minimum: 8 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true
end
