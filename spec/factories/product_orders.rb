FactoryBot.define do
  factory :product_order do
    product { nil }
    order { nil }
    amount { Faker::Number.digit }
  end
end
