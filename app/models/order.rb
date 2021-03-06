class Order < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
end
