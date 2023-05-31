FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Commerce.brand }
    price { Faker::Number.decimal(l_digits: 4, r_digits: 2)  }
    balance { Faker::Number.digit }
  end
end
