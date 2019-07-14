FactoryBot.define do
  factory :quiz_question_correct_answer do
    sequence(:content) { |n| "test correct answer#{n}" }
  end
end
