class LikesController < ApplicationController

  def create
  @bookmark = Bookmark.find(params[:bookmark_id])
  like = current_user.likes.build(bookmark: @bookmark)
  authorize like


    if like.save
      # Add code to generate a success flash and redirect to @bookmark
      flash[:notice] = "Liked Bookmark."
      redirect_to [@bookmark.topic]
    else
      # Add code to generate a failure flash and redirect to @bookmark
      flash[:alert] = "Fail to like."
      redirect_to [@bookmark.topic]
    end
  end

  def destroy
  # Get the bookmark from the params
  @bookmark = Bookmark.find(params[:bookmark_id])
  # Find the current user's like with the ID in the params
  like = current_user.likes.find(params[:id])
  authorize like

    if like.destroy
      # Flash success and redirect to @bookmark
       flash[:notice] = "Bookmark unlike."
       redirect_to [@bookmark.topic]
    else
      # Flash error and redirect to @bookmark
      flash[:alert] = "Unliking failed."
      redirect_to [@bookmark.topic]
    end
  end

end
