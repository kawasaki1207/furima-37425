FactoryBot.define do
  factory :item do
    name               { Faker::Lorem.sentence }
    content            { Faker::Lorem.sentence }
    category_id        { Faker::Number.within(range: 1..10) }
    status_id          { Faker::Number.within(range: 1..6) }
    delivery_charge_id { Faker::Number.within(range: 1..2) }
    prefecture_id      { Faker::Number.within(range: 1..47) }
    shopping_day_id    { Faker::Number.within(range: 1..3) }
    price              { Faker::Number.number(digits: 5) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
