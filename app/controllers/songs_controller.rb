require 'pry'
class SongsController < ApplicationController
  def new

  end

  def create
    @song = Song.create(song_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  def show
    @song = Song.find_by_id(:id)
    binding.pry
  end

  def edit
    @song = Song.find_by_id(:id)
  end

  def update
    @song = Song.find_by_id(:id)
    @song.update(song_params(:name, :author_id, :genre_id))
    redirect_to song_path(@song)
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
