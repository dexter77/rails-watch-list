class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.where(id: params[:list_id]).first
    # @movie = Movie.find(params[:movie_id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = List.find(params[:list_id])
    @bookmark.movie = Movie.find(params[:movie_id])
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render :new, status => :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
