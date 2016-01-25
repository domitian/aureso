
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "model#{n}@gmail.com" }
    password "abc"
  end

end
