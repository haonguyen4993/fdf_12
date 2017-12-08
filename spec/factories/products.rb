FactoryGirl.define do
  factory :product do
    description {Faker::Hacker.say_something_smart}
    price {Faker::Number.decimal(1)}
    status 0
    name {Faker::Name.name}
    image {Faker::Name.name}
    category nil
    shop nil
    user nil
    start_hour "00:00:00"
    end_hour "23:59:59"
  end
end
