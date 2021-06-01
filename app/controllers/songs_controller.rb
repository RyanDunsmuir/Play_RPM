class SongsController < ApplicationController
  before_action :set_song, only: %i[show edit update destroy]

  def index
    @songs = Song.all
  end

  def show
    authorize @song
  end

  def new
    @song = Song.new
    authorize @song
  end

  def create
    @song = Song.new(song_params)
    @song.user = current_user
    aithorize @song
    if @bookmark.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def destroy
    @song.destroy
    authorize @song

    redirect_to songs_path, notice: 'Song was successfully removed.'
  end

  def edit
  end

  def update
    authorize @song
    if @song.update(song_params)
      redirect_to @song, notice: "Song was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :album, :artist)
  end
end
