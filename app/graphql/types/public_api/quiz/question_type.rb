module Types::PublicAPI
  class Quiz::QuestionType < Types::BaseObject
    field :content,          String,                                   null: false
    field :answers, [::Types::PublicAPI::Quiz::Question::AnswerType], null: false
    field :correct_answer, ::Types::PublicAPI::Quiz::Question::CorrectAnswerType, null: false

    def answers
      ::PublicAPI::Quiz::Question.find(object.id).answers
    end
  end
end
