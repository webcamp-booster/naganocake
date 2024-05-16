class Public::OrdersController < ApplicationController
  # before_action :authenticate_customer! 後ほど有効にしてください。
  def new
    @order = Order.new
    @addresses = current_user.addresses.all
  end

  def confirm #注文情報入力確認画面
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.post_code = current_user.post_code
      @order.address = current_user.address
      @order.name = current_user.last_name + current_user.first_name
    elsif params[:order][:address_option] == "1"
      @order.post_code = address.post_code
      @order.address = address.address
      @order.name = address.name
    elsif params[:order][:address_option] == "2"
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render 'new'
    end

  end

  def thanks
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :name, :address, :post_code, :shipping_fee, :total_price, :status)
  end
end
