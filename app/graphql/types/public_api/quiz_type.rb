module Types::PublicAPI
  class QuizType < Types::BaseObject
    field :name,     String,                              null: false
    field :url_code, String,                              null: false
    field :quizzes, [::Types::PublicAPI::QuizType], null: false
    field :questions, [::Types::PublicAPI::Quiz::QuestionType], null: false

    def quizzes
      ::AssociationLoader.for(::Quiz).load(object)
    end

    def questions
      ::AssociationLoader.for(::Quiz, :questions).load(object)
    end
  end
end
