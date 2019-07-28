module Types::PublicAPI
  class QueryType < Types::BaseObject
    field :quizzes, [Types::PublicAPI::QuizType], null: true

    def quizzes
      ::PublicAPI::Quiz.all
    end
  end
end
