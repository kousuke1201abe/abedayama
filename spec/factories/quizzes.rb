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

FactoryBot.define do
  factory :quiz do
    sequence(:name) { |n| "test quiz name#{n}" }
    sequence(:url_code) { |n| "test quiz url_code#{n}" }
  end
end
