class OrdersController < ApplicationController
  before_action :initialize_cart

  def create
    
    order = Order.new(order_params)
    @cart.items.each do |item|
      order.order_items.new(product_id: item.product_id,
                    quantity: item.quantity)

    end

    if order.save
      nonce = params[:payment_method_nonce]
      result = Braintree::Transaction.sale(
        :amount => @cart.total_price,
        :payment_method_nonce => nonce
      )
      
      if result
        session[:my_cart] = nil
        flash[:notice] = "感謝大爺"
      else

        flash[:notice] = "刷卡失敗"

      end
        redirect_to products_path
    else
      render action: 'carts/checkout'
    end
  end
  
  private
  
  def order_params
    params.require(:order).permit(:name, :tel, :address, :email)
  end
end
