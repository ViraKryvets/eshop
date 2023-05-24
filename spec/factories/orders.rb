# FactoryBot.define do
#   factory :order do
#     firstname { "MyString" }
#     lastname { "MyString" }
#     address { "MyString" }
#     phone { "MyString" }
#   end
# end

FactoryBot.define do
  factory :order do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.cell_phone }
  end
end
