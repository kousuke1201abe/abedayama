class Quiz::Question::IncorrectAnswer < ApplicationRecord
  belongs_to :question
end
