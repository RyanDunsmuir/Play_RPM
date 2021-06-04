class OrderSongsController < ApplicationController
  def create
    @user = current_user
    @song = Song.find(params[:song_id])
    if @user.orders.find_by(status: "processing").present?
      @order = @user.orders.find_by(status: "processing")
    else
      @order = Order.create(user: current_user)
    end
    OrderSong.create(song: @song, order: @order)
    redirect_to order_path(@order)
  end

  def destroy
    @order_song = OrderSong.find(params[:id])
    @order_song.destroy
    redirect_to order_path, notice: 'Song was successfully removed.'
  end

end
