FactoryBot.define do
  factory :item do
    item_name              {"aaaaaa"}
    item_description       {"aaaaaa"}
    category_id            {"1"}
    item_status_id         {"1"}
    price                  {"1000"}
    shipping_fee_burden_id {"1"}
    shipping_area_id       {"1"}
    shipping_days_id       {"1"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end