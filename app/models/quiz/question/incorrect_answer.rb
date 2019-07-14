class Quiz::Question::IncorrectAnswer < ApplicationRecord
  belongs_to :question,
             inverse_of: :quiz_question_incorrect_answers
end
