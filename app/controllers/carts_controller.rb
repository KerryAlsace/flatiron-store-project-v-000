class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end
  
  def show
    define_cart
  end
  
  def new
    @cart = Cart.new
  end
  
  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      flash[:notice] = "Cart successfully created"
      redirect_to cart_path(@cart)
    else
      flash[:alert] = "Cart could not be created"
      render :new
    end
  end
  
  def edit
    define_cart
  end
  
  def update
    define_cart
    if @cart.update(cart_params)
      flash[:notice] = "Cart successfully updated"
      redirect_to cart_path(@cart)
    else
      flash[:alert] = "Cart could not be updated"
      render :edit
    end
  end
  
  def destroy
    define_cart
    @cart.destroy
    flash[:notice] = "Cart successfully deleted"
    redirect_to items_path
  end

  # post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'
  def checkout
  end

  private
    def define_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params.require(:cart).permit()
    end

end
