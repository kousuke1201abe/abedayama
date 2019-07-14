FactoryBot.define do
  factory :quiz_question do
    sequence(:content) { |n| "test quiz question content#{n}" }
  end
end
