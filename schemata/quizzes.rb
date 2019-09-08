create_table :quizzes do |t|
  t.string :name,
           null: false,
           index: {
             unique: false,
             name: :idx_quizzes_1,
           }
  t.string :url_code,
           null: false,
           index: {
             unique: false,
             name: :idx_quizzes_2,
           }
end
