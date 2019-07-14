class Quiz::Question::CorrectAnswer < ApplicationRecord
  belongs_to :question
end
