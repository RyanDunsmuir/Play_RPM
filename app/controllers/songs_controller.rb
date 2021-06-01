class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @bookmark.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def destroy
    @song.destroy

    redirect_to songs_path, notice: 'Song was successfully removed.'
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to @song, notice: "Song was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_songs
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :album, :artist)
  end
end
