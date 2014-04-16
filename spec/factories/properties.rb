# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :property do
    title "Charming Oak Cottage"
    description Faker::Lorem.sentence(3)
    city Faker::Address.city
    state Faker::Address.state
    price 78
  end
end
