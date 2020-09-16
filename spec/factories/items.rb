FactoryBot.define do
  factory :item do
    title         { Faker::Name.initials(number: 40) }
    text          { Faker::Name.initials(number: 50) }
    category      { '2' }
    condition     { '2' }
    delivery_fee  { '2' }
    delivery_area { '2' }
    shipping_day  { '2' }
    price         { '300' }
    association   :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
