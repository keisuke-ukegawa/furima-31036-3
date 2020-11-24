class PurchaseRecordAddress
  include ActiveModel::Model
  atter_accessor :street, :shipping_area_id, :city, :postal_code, :building, :phone_number, :purchase_record 
  
  with_options presence: true do
    validates :street
    validates :shipping_area_id
    validates :city
    validates :postal_code
    validates :building
    validates :phone_number
    validates :purchase_record
  end

  def save
    purchase_record = PurchaseRecord.create
    Address.create(street: street, shipping_area_id: shipping_area_id, city: city, postal_code: postal_code, building: building, phone_number: phone_number, purchase_record: purchase_record)
  end
end