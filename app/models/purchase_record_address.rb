class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :street, :user_id, :item_id, :shipping_area_id, :city, :postal_code, :building, :phone_number, :purchase_record_id, :token
  
  with_options presence: true do
    validates :token
    validates :street
    validates :shipping_area_id, numericality: { other_than: 0}
    validates :city
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    #validates :purchase_record_id
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(street: street, shipping_area_id: shipping_area_id, city: city, postal_code: postal_code, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end