module Types::PublicAPI
  class Quiz::QuestionType < Types::BaseObject
    field :content,          String,                                   null: false
    field :correct_answer,   ::Types::PublicAPI::Quiz::Question::CorrectAnswerType,   null: false
    field :incorrect_answers, [::Types::PublicAPI::Quiz::Question::IncorrectAnswerType], null: false
  end
end
