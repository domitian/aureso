FactoryGirl.define do
  factory :model_type do
    sequence(:name) { |n| "model_type_#{n}" }
model_type_code "MyString"
base_price 1
model
  end

end
