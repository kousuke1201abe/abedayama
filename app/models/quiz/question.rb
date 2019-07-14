class Quiz::Question < ApplicationRecord
  belongs_to :quiz
  has_many :incorrect_answers,
           dependent: :destroy,
           foreign_key: :quiz_question_id
  has_one  :correct_answer,
           dependent: :destroy,
           foreign_key: :quiz_question_id
end
