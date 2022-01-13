class ItemsController < ApplicationController

  def index
  	@items = Item.all.where(deleted: false).order('created_at DESC')
  end

  def destroy
  	item = Item.find(params[:id])
  	if item.update(deleted: true)
  		redirect_to items_path
  	end
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to new_item_url
    else
      redirect_to new_item_url, notice: item.errors.full_messages
    end
  end

  private

  def item_params
    params[:item].permit(:name, :description, :quantity)
  end

end