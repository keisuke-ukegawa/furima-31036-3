class PurchaseRecordController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @purchase_record_address = PurchaseRecordAddress.new
  end

  def create
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_params)
    if @purchase_record_address.valid?
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index
    end

    private

    def purchase_record_params
      params.require(:purchase_record_address).permit(:street, :shipping_area_id, :city, :postal_code,:building, :phone_number, :purchase_record).merge(user_id: current_user.id)
    end
  end
end
