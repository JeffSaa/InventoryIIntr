class ItemsController < ApplicationController

  def index
  	@items = Item.all.where(deleted: false)
  end

  def destroy
  	item = Item.find(params[:id])
  	if item.update(deleted: true)
  		redirect_to items_path
  	end
  end

end