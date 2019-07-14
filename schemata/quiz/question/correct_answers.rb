create_table :quiz_question_correct_answers do |t|
  t.references :quiz_question,
               null: false,
               index: {
                 unique: false,
                 name: :idx_quiz_question_correct_answers_1,
               }
  t.string :content,
           null: false,
           index: {
             unique: false,
             name: :idx_quiz_question_correct_answers_2,
           }
end

add_foreign_key :quiz_question_correct_answers,
                :quiz_questions,
                name: :fk_quiz_question_correct_answers_1
