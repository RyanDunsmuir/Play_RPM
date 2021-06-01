class SongsController < ApplicationController
  before_action :set_song, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, except: %i[new create]

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
    @song.user = current_user
    rand_seed_gen = Faker::Number.number(digits: 8)
    @song.cover = "https://picsum.photos/seed/#{rand_seed_gen}/600/400"

    if @song.save
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

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :album, :artist)
  end
end
