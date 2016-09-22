class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end
  
  def show
  end
  
  def new
    @cart = Cart.new
  end
  
  def create
    @cart = Cart.new(cart_params)
    @cart.save
    flash[:notice] = "Cart successfully created"

    redirect_to cart_path(@cart)
  end
  
  def edit
  end
  
  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      flash[:notice] = "Cart successfully updated"

      redirect_to cart_path(@cart)
    else
      flash[:alert] = "Cart could not be updated"

      render :edit
    end
  end
  
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    flash[:notice] = "Cart successfully deleted"

    redirect_to items_path
  end

  # post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'
  def checkout
    if current_user.current_cart != nil
      @current_cart = current_user.current_cart
      @current_cart.update_inventory_after_checkout
      flash[:notice] = "Checkout successful"

      redirect_to cart_path(@current_cart)
    end
  end

  private
    def cart_params
      params.require(:cart).permit(:user, :user_id, :item_id, :line_item_id)
    end

end

# def ride
#     @ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction_id].to_i)
#     @attraction = Attraction.find(params[:attraction_id].to_i)
#     # binding.pry
#     if @ride.take_ride == true
#       flash[:notice] = "Thanks for riding the #{@attraction.name}!"
#       redirect_to user_path(current_user)
#     else
#       flash[:alert] = @ride.take_ride
#       redirect_to user_path(current_user)
#     end
#   end

# <%= button_to "Go on this ride", {:controller => "users", :action => "ride", :attraction_id => @attraction.id, :user_id=> session[:user_id]}, :method=>:post %>

# <%= button_to 'Checkout', checkout_path %>