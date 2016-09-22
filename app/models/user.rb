class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable, :rememberable, :trackable, 
  devise :database_authenticatable, :registerable, :validatable
  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'

end
