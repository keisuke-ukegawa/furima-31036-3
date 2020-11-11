require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe 'ログイン機能' do
     it "商品名が必須である事" do
       @item.item_name = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Item name can't be blank")
     end
     it "商品名の説明が必須である事" do
       @item.item_description = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Item description can't be blank")
     end
     it "カテゴリーの情報が必須である事" do
       @item.category_id = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Category can't be blank")
     end
     it "商品の状態についての情報が必須である事" do
       @item.item_status_id = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Item status can't be blank")
     end
     it "配送料の負担についての情報が必須である事" do
       @item.shipping_fee_burden_id = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
     end
     it "発送元の地域についての情報が必須である事" do
       @item.shipping_area_id = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping area can't be blank")
     end
     it "発送までの日数についての情報が必須である事" do
       @item.shipping_days_id = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping days can't be blank")
     end
     it "価格についての情報が必須である事" do
       @item.price = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Price can't be blank")
     end
     it '価格の範囲が、¥300~¥9,999,999の間であること' do
       @item.price = "¥299"
       @item.valid?
       expect(@item.errors.full_messages).to include("Price is not included in the list")
     end
     it '画像が１枚必須であること' do
       @item.image = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Image can't be blank")
     end
     it '販売価格は半角数字のみ入力可能であること' do
       @item.price = "３００"
       @item.valid?
       expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it '価格が￥10,000,000以下であること' do
      @item.price = '¥10,000,000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
  end
end