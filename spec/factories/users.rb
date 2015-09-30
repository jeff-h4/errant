FactoryGirl.define do
  factory :user do
    my_first_name = Faker::Name.first_name
    sequence(:id)     {|n| "#{n}"}
    first_name        my_first_name
    last_name         Faker::Name.last_name
    sequence(:email)  {|n| "#{n}-#{Faker::Internet.email}"}
    password          my_first_name
  end

end
