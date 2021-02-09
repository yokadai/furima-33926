class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: [:index, :new ]
  before_action :set_item, only: [:index, :create]
  before_action :saler
  before_action :purchased_item
  
  
  def index
  end

  def new
  end

  def create
    user_id = current_user.id
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      payJp
       @purchase.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def purchase_params
    params.require(:purchase).permit(:postal_code, :prefecture_id, :city, :lot_number, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def payJp
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: purchase_params[:token],
        currency: 'jpy'
      )
    end

    def set_purchase
      @purchase = Purchase.new
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def saler
      if current_user.id == @item.user_id
        redirect_to root_path
      end
    end

    def purchased_item
      if @item.user_item.present?
        redirect_to root_path
      end
    end


end
