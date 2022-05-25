FactoryBot.define do
  factory :item do
    name            {Faker::Lorem.sentence}
    content         {Faker::Lorem.sentence}
    category        {Category.all.sample}
    status          {Status.all.sample}
    delivery_charge {DeliveryCharge.all.sample}
    prefecture      {Prefecture.all.sample}
    shopping_day    {ShoppingDay.all.sample}
    price           {Faker::Number.number(digits: 5)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
