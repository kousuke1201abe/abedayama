# == Schema Information
#
# Table name: quiz_questions
#
#  id         :bigint(8)        not null, primary key
#  content    :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quiz_id    :bigint(8)        not null
#
# Indexes
#
#  idx_contents_1        (quiz_id)
#  idx_quiz_questions_2  (content)
#
# Foreign Keys
#
#  fk_quiz_questions_1  (quiz_id => quizzes.id)
#

class Quiz::Question < ApplicationRecord
  belongs_to :quiz
  has_many :incorrect_answers,
           dependent: :destroy,
           foreign_key: :quiz_question_id
  has_one  :correct_answer,
           dependent: :destroy,
           foreign_key: :quiz_question_id,
           inverse_of: :quiz_question
end
