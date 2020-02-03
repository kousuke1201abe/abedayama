# == Schema Information
#
# Table name: quizzes
#
#  id         :bigint(8)        not null, primary key
#  image_url  :string(255)      not null
#  name       :string(255)      not null
#  url_code   :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  idx_quizzes_1  (name)
#  idx_quizzes_2  (image_url)
#  idx_quizzes_3  (url_code)
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
