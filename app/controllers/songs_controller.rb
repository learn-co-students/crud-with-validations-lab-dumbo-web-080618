require 'pry'
class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    set_song
  end

  def new
    @song = Song.new
  end

  def create
    # binding.pry
    @song = Song.create(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end

  end



  def edit
    set_song
  end

  def update
    set_song.update(song_params)
    # binding.pry
    if @song.save


      redirect_to @song
    else

      render :edit
    end

  end

  def destroy
    set_song.destroy
    redirect_to songs_path
  end


  private

  def song_params
    params.require(:song).permit(:artist_name, :title, :released, :release_year, :genre)
  end

  def set_song
    @song = Song.find(params[:id])
  end

end



#
