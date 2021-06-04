class OrdersController < ApplicationController

  def show
    #checkout page
    #overview your order
    #button to click to finish
    @order = current_user.orders.find_by(status: "processing")
  end

  def update
    #changing the status to completed!
    #redirect to index page
    @order = Order.find(params[:id])
    @order.status = "completed"
    @order.save
    redirect_to songs_path
  end
end
