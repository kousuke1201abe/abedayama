module Types::PublicAPI
  class MutationType < Types::BaseObject
    field :createQuiz,
          mutation: Mutations::PublicAPI::CreateQuiz
  end
end
