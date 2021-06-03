class PagesController < ApplicationController
  skip_before_action :authenticate_user!;

  def home
  end

  def mysongs
      @user = current_user
      @songs = @user.songs.all
  end

end
