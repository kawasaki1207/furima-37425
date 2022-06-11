FactoryBot.define do
  factory :order_card do
    post_code     {Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4)}
    city          {Gimei.city.kanji}
    address       {Faker::Address.street_address}
    building      {Faker::Address.street_address}
    tel           {Faker::Number.decimal_part(digits: 11)}
    prefecture_id {Faker::Number.within(range: 1..47) }
    token         {"tok_abcdefghijk00000000000000000"}
    user_id       {Faker::Number.non_zero_digit}
    item_id       {Faker::Number.non_zero_digit}
  end
end
