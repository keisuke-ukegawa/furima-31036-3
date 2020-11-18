class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :category_id, :item_status_id, :shipping_fee_burden_id, :shipping_area_id, :shipping_days_id, :item_description, :price).merge(user_id: current_user.id)
  end
end
