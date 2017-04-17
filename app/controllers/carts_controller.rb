class CartsController < ApplicationController

  def show
    if session[:email]
      @email = session[:email]
    end
  end

  def set_email
    session[:email] = params[:email]
    redirect_to :back
  end

  def add_item
    product_id = params[:product_id].to_s
    item = cart[product_id] || { "quantity" => 0 }
    item["quantity"] += 1
    cart[product_id] = item
    update_cart cart
    redirect_to :back
  end

  def remove_item
    product_id = params[:product_id].to_s
    item = cart[product_id] || { "quantity" => 1 }
    item["quantity"] -= 1
    cart[product_id] = item
    cart.delete(product_id) if item["quantity"] < 1
    update_cart cart
    redirect_to :back
  end

end
