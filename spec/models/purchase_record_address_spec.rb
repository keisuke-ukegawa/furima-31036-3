require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  before do
    @purchase_record_address = FactoryBot.build(:purchase_record_address)
  end
  describe '商品購入情報' do
    context '商品購入成功' do
      it "全て正常" do
        expect(@purchase_record_address.valid?).to eq false
      end
      it "建物名が空でも登録できる" do
        @purchase_record_address.building = nil
        expect(@purchase_record_address.valid?).to eq false
      end
      it "tokenがあれば保存ができること" do
        expect(@purchase_record_address.valid?).to eq false
      end
    end

    context '商品購入失敗' do
      it "tokenが空では登録できないこと" do
        @purchase_record_address.token = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空では登録できない" do
        @purchase_record_address.postal_code = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号にハイフンが含まれていばければ保存されない" do
        @purchase_record_address.postal_code = 4567893
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Postal code is invalid")
      end
      it "電話番号が空では登録できない" do
        @purchase_record_address.phone_number = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号にハイフンが含まれていると保存できない" do
        @purchase_record_address.phone_number = '345-35467-347'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号が11桁を超えると登録できない" do
        @purchase_record_address.phone_number = 767689765432
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "都道府県を選択していないと登録できない" do
        @purchase_record_address.shipping_area_id = 0
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Shipping area must be other than 0")
      end
      it "市区町村が空では登録できない" do
        @purchase_record_address.city = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空では登録できない" do
        @purchase_record_address.street = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Street can't be blank")
      end
    end
  end
end