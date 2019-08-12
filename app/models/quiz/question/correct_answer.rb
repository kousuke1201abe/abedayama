# == Schema Information
#
# Table name: quiz_question_correct_answers
#
#  id               :bigint(8)        not null, primary key
#  content          :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  quiz_question_id :bigint(8)        not null
#
# Indexes
#
#  idx_quiz_question_correct_answers_1  (quiz_question_id)
#  idx_quiz_question_correct_answers_2  (content)
#
# Foreign Keys
#
#  fk_quiz_question_correct_answers_1  (quiz_question_id => quiz_questions.id)
#

class Quiz::Question::CorrectAnswer < ApplicationRecord
  belongs_to :quiz_question
end
