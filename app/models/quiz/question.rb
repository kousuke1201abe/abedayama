class Quiz::Question < ApplicationRecord
  belongs_to :quiz
  has_many :incorrect_answers,
           dependent: :destroy
  has_one  :correct_answer,
           dependent: :destroy
end
