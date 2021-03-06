class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable, :rememberable, :trackable, 
  devise :database_authenticatable, :registerable, :validatable
  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'

  def set_current_cart
    new_cart = carts.create
    self.current_cart_id = new_cart.id
    save
  end

  def delete_current_cart
    self.current_cart_id = nil
    save
  end

end
