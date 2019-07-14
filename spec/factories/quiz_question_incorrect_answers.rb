FactoryBot.define do
  factory :quiz_question_incorrect_answer do
    sequence(:content) { |n| "test incorrect answer#{n}" }
  end
end
