FactoryGirl.define do
  factory :model do
    sequence(:name) { |n| "model#{n}" }
    organisation
  end

end
