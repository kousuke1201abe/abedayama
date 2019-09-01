module Types::PublicAPI
  class Quiz::Question::IncorrectAnswerType < Types::BaseObject
    field :content, String, null: false
  end
end
