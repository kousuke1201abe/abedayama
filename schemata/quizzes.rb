create_table :quizzes do |t|
  t.string :name,
           null: false,
           index: {
             unique: false,
             name: :idx_quizzes_1,
           }
end
