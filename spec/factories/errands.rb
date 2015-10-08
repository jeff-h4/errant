FactoryGirl.define do
  factory :errand do
    sequence(:title)        { Faker::Hacker.say_something_smart }
    sequence(:item_name)    { Faker::Commerce.product_name }
    sequence(:price)        { Faker::Commerce.price }
    sequence(:store)        { Faker::Company.name }
    sequence(:created_at)   { Time.now - 60.days + rand(1..20).days }
    sequence(:updated_at)   { Time.now - rand(1..20).days }
    sequence(:aasm_state)   { ["posted","accepted","completed"].sample }
  end


end
