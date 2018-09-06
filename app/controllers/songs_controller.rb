require 'byebug'

class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def show
    find_song
    if @song.released == true
      @released = "Released"
    elsif @song.released == false
      @released = "Not released"
    end
  end

  def edit
    find_song
  end

  def update
    find_song
    if @song.update(song_params)
      redirect_to @song
    else
      render "edit"
    end
  end

  def destroy
    find_song
    @song.destroy
    redirect_to songs_path, notice: "Delete success"
  end

  private
  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def find_song
    @song = Song.find(params[:id])
  end
end
