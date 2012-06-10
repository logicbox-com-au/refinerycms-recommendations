
FactoryGirl.define do
  factory :recommendation, :class => Refinery::Recommendations::Recommendation do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

