create_table :quiz_question_incorrect_answers do |t|
  t.references :quiz_question,
               null: false,
               index: {
                 unique: false,
                 name: :idx_quiz_question_incorrect_answers_1,
               }
  t.string :content,
           null: false,
           index: {
             unique: false,
             name: :idx_quiz_question_incorrect_answers_2,
           }
end

add_foreign_key :quiz_question_incorrect_answers,
                :quiz_questions,
                name: :fk_quiz_question_incorrect_answers_1
