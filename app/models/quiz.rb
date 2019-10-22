# == Schema Information
#
# Table name: quizzes
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  idx_quizzes_1  (name)
#

class Quiz < ApplicationRecord
  has_many :questions,
           dependent: :destroy

  def calc_correct_num(args)
    args[:answers].map.with_index do |answer, i|
      answer == self.questions[i].correct_answer.content ? 1 : 0
    end.inject(:+)
  end
end
