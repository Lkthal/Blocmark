class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
  # populate @user_bookmarks with the user's bookmarks
    @user = User.find(params[:id])
    @user = current_user
    @user_bookmarks = @user.bookmarks
    @liked_bookmarks = @user.liked_bookmarks

  end
end
