class UsersController < ApplicationController
  def show
  # populate @user_bookmarks with the user's bookmarks
    @user = current_user
    @user_bookmarks = @user.bookmarks
  # populate @liked_bookmarks with liked bookmarks
    @liked_bookmarks = @user.liked_bookmarks
  end
end
