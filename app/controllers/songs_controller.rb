class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
    #release_option
  end

  def create
    @song = Song.create(strong_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    find_song
  end

  def show
    find_song
  end

  def update
    find_song
    @song.update(strong_params)
    if @song.save 
      redirect_to song_path(@song)
    else
      find_song
      #release_option
      render :edit
    end
  end

  def destroy
    find_song
    @song.destroy
    redirect_to songs_path
  end

  private
  def strong_params
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end

  def find_song
    @song = Song.find(params[:id])
  end

  # def #release_option
  #   @release = [true, false]
  # end

end
