class StoreController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.available_items
    if !user_signed_in?
      return
    end
    if current_user.current_cart != nil
      @current_cart = current_user.current_cart
    else
      current_user.current_cart = current_user.carts.create
      @current_cart = current_user.current_cart
    end
  end
  
end
# <%= button_to 'Add to Cart', cart_path(@current_cart) %>
# <%= button_to "Add to Cart", {controller: "carts", id: @current_cart.id, action: "show"}, method: :get %>
