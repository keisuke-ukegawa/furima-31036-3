class PurchaseRecordController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index,:create]
  
  def index
    #binding.pry
    @purchase_record_address = PurchaseRecordAddress.new
  end

  def create
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_address_params)
    if @purchase_record_address.valid?
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private  

  def purchase_record_address_params
    params.require(:purchase_record_address).permit(:street, :shipping_area_id, :city, :postal_code, :building, :phone_number, :purchase_record).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
