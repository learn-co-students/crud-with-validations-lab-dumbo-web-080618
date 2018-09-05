class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song =  Song.new
  end

  def show
    @song = Song.find(params[:id])
  end

  def create
    if @song = Song.create(strong_params)
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(strong_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_url
  end

  private

  def strong_params
    params.require(:song).permit(:title,:released,:release_year,:artist_name,:genre)
  end


end
