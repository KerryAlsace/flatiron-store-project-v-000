class LineItemsController < ApplicationController

  def new
    @line_item = LineItem.new
  end

  def create
    @line_item = LineItem.new(line_item_params)
    if @line_item.save
      flash[:notice] = "Line item successfully created"
      redirect_to line_item_path(@line_item)
    else
      flash[:message] = "Line item could not be created"
      render :new
    end
  end

  private
    def line_item_params
      params.require(:line_item).permit()
    end

end
