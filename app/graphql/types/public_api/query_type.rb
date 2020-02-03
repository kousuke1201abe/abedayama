module Types::PublicAPI
  class QueryType < Types::BaseObject
    field :quizzes, [Types::PublicAPI::QuizType], null: true
    field :quiz,    Types::PublicAPI::QuizType,   null: true do
      argument :url_code, String, required: true
    end

    def quizzes
      ::Quiz.order(created_at: :desc).limit(30)
    end

    def quiz(url_code:)
      ::PublicAPI::Quiz.find_by(url_code)
    end
  end
end
