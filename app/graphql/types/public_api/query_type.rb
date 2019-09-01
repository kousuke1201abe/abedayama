module Types::PublicAPI
  class QueryType < Types::BaseObject
    field :quizzes, [Types::PublicAPI::QuizType], null: true
    field :quiz,    Types::PublicAPI::QuizType,   null: true do
      argument :id, Integer, required: true
    end

    def quizzes
      ::PublicAPI::Quiz.all
    end

    def quiz(id:)
      ::PublicAPI::Quiz.find(id)
    end
  end
end
