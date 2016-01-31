class CartsController < ApplicationController
  before_action :initialize_cart

 #  def initialize_cart
 #    @cart = Cart.build_from_hash(session[:my_cart])
 #  end
  #  搬到application_controller去放
  #
  def add

    product = Product.find_by(id: params[:id])
    if product
      @cart.add_item(params[:id])
      session[:my_cart] = @cart.serialize
      flash[:notice] = "感謝您，已加到購物車!"
    else
      flash[:notice] = "查無此商品"
    end
    redirect_to products_path
  end
end
