FactoryBot.define do
  factory :quiz do
    sequence(:name) { |n| "test quiz name#{n}" }
  end
end
