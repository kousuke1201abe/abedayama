module Types::PublicAPI
  class Quiz::Question::AnswerType < Types::BaseObject
    field :content, String, null: false
  end
end
