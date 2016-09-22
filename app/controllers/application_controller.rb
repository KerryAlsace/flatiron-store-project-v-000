class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_current_cart

  private
    def set_current_cart
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
