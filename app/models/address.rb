class Address < ApplicationRecord
  with_options presence: true do
    validates :street
    validates :shipping_area_id
    validates :city
    validates :postal_code
    validates :building
    validates :phone_number
    validates :purchase_record
  end
  belongs_to : purchase_record
end
