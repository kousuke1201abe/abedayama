create_table :quiz_questions do |t|
  t.references :quiz,
               null: false,
               index: {
                 unique: false,
                 name: :idx_contents_1,
               }
  t.string :content,
           null: false,
           index: {
             unique: false,
             name: :idx_quiz_questions_2,
           }
end

add_foreign_key :quiz_questions,
                :quizzes,
                name: :fk_quiz_questions_1
