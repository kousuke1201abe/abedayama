module Types::PublicAPI
  class QuizType < Types::BaseObject
    field :name,     String,                              null: false
    field :url_code, String,                              null: false
    field :image_url, String,                             null: false
    field :quizzes, [::Types::PublicAPI::QuizType], null: false
    field :questions, [::Types::PublicAPI::Quiz::QuestionType], null: false
    field :correct_num, Integer, null: true do
      argument :answers, [String], required: true
    end

    def quizzes
      ::AssociationLoader.for(::Quiz).load(object)
    end

    def questions
      ::AssociationLoader.for(::Quiz, :questions).load(object)
    end

    def correct_num(args)
      object.calc_correct_num(args)
    end
  end
end
