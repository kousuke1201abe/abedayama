class Quiz::Question::CorrectAnswer < ApplicationRecord
  belongs_to :question,
             inverse_of: :quiz_question_correct_answer
end
