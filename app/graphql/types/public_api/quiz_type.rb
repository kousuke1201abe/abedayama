module Types::InternalAPI
  class QuizType < Types::BaseObject
    field :name,     String,                              null: false
    field :quizzes, [::Types::PublicAPI::QuizType], null: false

    def quizzes
      ::AssociationLoader.for(::Quiz).load(object)
    end
  end
end
