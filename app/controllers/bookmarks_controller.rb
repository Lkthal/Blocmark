class BookmarksController < ApplicationController

  # before_action :authenticate_user!, except: [ :show ]

  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
      @topic = Topic.find(params[:topic_id])
      @bookmark = Bookmark.new(bookmark_params)

      authorize @bookmark
      # binding.pry
      if @bookmark.save!
        flash[:notice] = "Bookmark was saved."
        redirect_to [@topic, @bookmark]
      else
        flash.now[:alert] = "There was an error saving the ur. Please try again."
        render :new
      end
    end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

  end

  def update

    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

     if @bookmark.update_attributes(bookmark_params)
       flash[:notice] = "Bookmark was updated."
       redirect_to [@topic, @bookmark]
     else
       flash.now[:alert] = "There was an error saving the url. Please try saving again."
       render :edit
     end
 end

 def destroy
   @bookmark = Bookmark.find(params[:id])
   authorize @bookmark

   if @bookmark.destroy
     flash[:notice] = "\"#{@bookmark.url}\"was deleted successfully."
     redirect_to topics_path
   else
     flash.now[:alert] = "There was an error deleting the url."
     render :show
   end
 end

 private

def bookmark_params
  params.require(:bookmark).permit(:url, :topic_id)
end

end
