# FactoryBot.define do
#   factory :product do
#     name { "MyString" }
#     description { "MyText" }
#     price { "9.99" }
#     balance { 1 }
#   end
# end

FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Commerce.brand }
    price { Faker::Number.decimal(l_digits: 4, r_digits: 2)  }
    balance { Faker::Number.digit }
  end
end
