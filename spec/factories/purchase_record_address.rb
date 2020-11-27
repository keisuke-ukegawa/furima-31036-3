FactoryBot.define do
  factory :purchase_record_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    shipping_area_id { 2 }
    city { '1−2' }
    street { 45 }
    building { '高松ビル' }
    phone_number { 32112345678 }
    purchase_record_id { 2 }
  end
end 