class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :topics, dependent: :destroy
  has_many :likes, dependent: :destroy
<<<<<<< HEAD

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end

=======
>>>>>>> 669c3770873057054b42a379a59b9c57f1e03662

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end

  
end
