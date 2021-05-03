FactoryBot.define do
  factory :product do
    name                {Faker::Name.initials}
    description         {Faker::Lorem.sentence}
    price               {Faker::Number.within(range: 300..9999999)}
    category_id         {Faker::Number.within(range: 1..10)}
    condition_id        {Faker::Number.within(range: 1..6)}
    shipping_charge_id  {Faker::Number.within(range: 1..2)}
    prefecture_id       {Faker::Number.within(range: 1..47)}
    ship_to_day_id      {Faker::Number.within(range: 1..3)}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
