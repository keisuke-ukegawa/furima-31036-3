FactoryBot.define do
  factory :purchase_record_address do
    postal_code { '123-4567' }
    shipping_area_id { '香川県高松市' }
    city { '1−2' }
    street { 45 }
    building { '高松ビル' }
    phone_number { 32112345678 }
  end
end 