class BookmarksController < ApplicationController

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = List.find(params[:list_id])
    @bookmark.movie = Movie.find(params[:movie_id])
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render "lists/show"
    end
  end
end
