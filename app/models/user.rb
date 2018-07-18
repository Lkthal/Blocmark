class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :topics, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end


end
