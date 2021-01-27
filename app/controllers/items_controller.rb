class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user == current_user
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :description, :shipping_fee_id, :shipping_day_id, :prefecture_id,
                                 :state_id, :price, :category_id).merge(user_id: current_user.id)
  end
end
