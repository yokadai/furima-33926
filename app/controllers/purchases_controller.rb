class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
       @purchase.save
       redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private
  
  def purchase_params
    params.permit(:postal_code, :prefecture_id, :city, :lot_number, :building, :phone_number, :user_id, :card_number, :card_exp_month, :card_exp_year, :card_cvc)
  end


end
