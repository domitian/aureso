FactoryGirl.define do
  factory :organisation do
    sequence(:name) { |n| "person#{n}" }
public_name "MyString"
type ""
pricing_policy "Flexible"
  end

end
