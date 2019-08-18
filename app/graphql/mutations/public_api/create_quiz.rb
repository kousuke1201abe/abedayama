module Mutations::PublicAPI
  class CreateQuiz < GraphQL::Schema::RelayClassicMutation
    # return fields
    field :quiz,
          Types::PublicAPI::QuizType,
          null: false

    argument :name, String, required: true

    def resolve(args)
      {
        quiz:
          ::PublicAPI::Quiz
            .create!(args)
            .quiz
      }
    end
  end
end
