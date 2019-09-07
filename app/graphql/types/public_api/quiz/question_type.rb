module Types::PublicAPI
  class Quiz::QuestionType < Types::BaseObject
    field :content,          String,                                   null: false
    field :answers, [::Types::PublicAPI::Quiz::Question::AnswerType], null: false
  end

  def answers
    ::InternalAPI::Quiz::Question.find(object.id).answers
  end
end
