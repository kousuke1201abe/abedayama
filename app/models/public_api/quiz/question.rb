class PublicAPI::Quiz::Question < ApplicationModel
  attribute :question

  def self.find(id)
    raise ActiveRecord::RecordNotFound unless ::Quiz::Question.exists?(id: id)
    new(question: ::Quiz::Question.find(id))
  end

  def answers
    answers_hash = question.incorrect_answers.map do |incorrect_answer|
      incorrect_answer.attributes.symbolize_keys.slice(:content)
    end
    answers_hash << question.correct_answer.attributes.symbolize_keys.slice(:content)
    answers_hash.shuffle!
  end
end
