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

FactoryBot.define do
  factory :quiz do
    sequence(:image_url) { |n| "test quiz image_url#{n}" }
    sequence(:name) { |n| "test quiz name#{n}" }
    sequence(:url_code) { |n| "test quiz url_code#{n}" }
  end
end
