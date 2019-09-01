module Types::PublicAPI
  class Quiz::Question::CorrectAnswerType < Types::BaseObject
    field :content, String, null: false
  end
end
