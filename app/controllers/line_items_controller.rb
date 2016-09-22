class LineItemsController < ApplicationController

  def new
    @line_item = LineItem.new
  end

  def create
    @line_item = LineItem.create(cart_id: params[:cart_id], item_id: params[:item_id])
  end

end
