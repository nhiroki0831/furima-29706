FactoryBot.define do
  factory :order_shipping do
    postal_code           { '123-4567' }
    prefecture_id         { '2' }
    city                  { '横浜市緑区' }
    addresss              { '123-4567' }
    tel                   { '09012345678' }
  end
end