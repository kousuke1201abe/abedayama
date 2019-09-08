quiz =
  ::Quiz.find_or_create_by!(
    name: "test quiz name",
    url_code: SecureRandom.uuid
  )

quiz_question_1 =
  quiz.questions.find_or_create_by!(
    content: "test quiz question 1",
  )
quiz_question_1_correct_answer =
  quiz_question_1.correct_answer ||
  quiz_question_1.create_correct_answer(
    content: "test quiz correct answer",
  )
quiz_question_1_incorrect_answer_1 =
  quiz_question_1.incorrect_answers.find_or_create_by!(
    content: "test quiz incorrect answer 1",
  )
quiz_question_1_incorrect_answer_2 =
  quiz_question_1.incorrect_answers.find_or_create_by!(
    content: "test quiz incorrect answer 2",
  )
quiz_question_1_incorrect_answer_3 =
  quiz_question_1.incorrect_answers.find_or_create_by!(
    content: "test quiz incorrect answer 3",
  )

quiz_question_2 =
  quiz.questions.find_or_create_by!(
    content: "test quiz question 2",
  )
quiz_question_2_correct_answer =
  quiz_question_2.correct_answer ||
  quiz_question_2.create_correct_answer(
    content: "test quiz correct answer",
  )
quiz_question_2_incorrect_answer_1 =
  quiz_question_2.incorrect_answers.find_or_create_by!(
    content: "test quiz incorrect answer 1",
  )
quiz_question_2_incorrect_answer_2 =
  quiz_question_2.incorrect_answers.find_or_create_by!(
    content: "test quiz incorrect answer 2",
  )
quiz_question_2_incorrect_answer_3 =
  quiz_question_2.incorrect_answers.find_or_create_by!(
    content: "test quiz incorrect answer 3",
  )

quiz_question_3 =
  quiz.questions.find_or_create_by!(
    content: "test quiz question 3",
  )
quiz_question_3_correct_answer =
  quiz_question_3.correct_answer ||
  quiz_question_3.create_correct_answer(
    content: "test quiz correct answer",
  )
quiz_question_3_incorrect_answer_1 =
  quiz_question_3.incorrect_answers.find_or_create_by!(
    content: "test quiz incorrect answer 1",
  )
quiz_question_3_incorrect_answer_2 =
  quiz_question_3.incorrect_answers.find_or_create_by!(
    content: "test quiz incorrect answer 2",
  )
quiz_question_3_incorrect_answer_3 =
  quiz_question_3.incorrect_answers.find_or_create_by!(
    content: "test quiz incorrect answer 3",
  )

quiz_question_4 =
  quiz.questions.find_or_create_by!(
    content: "test quiz question 4",
  )
quiz_question_4_correct_answer =
  quiz_question_4.correct_answer ||
  quiz_question_4.create_correct_answer(
    content: "test quiz correct answer",
  )
quiz_question_4_incorrect_answer_1 =
  quiz_question_4.incorrect_answers.find_or_create_by!(
    content: "test quiz incorrect answer 1",
  )
quiz_question_4_incorrect_answer_2 =
  quiz_question_4.incorrect_answers.find_or_create_by!(
    content: "test quiz incorrect answer 2",
  )
quiz_question_4_incorrect_answer_3 =
  quiz_question_4.incorrect_answers.find_or_create_by!(
    content: "test quiz incorrect answer 3",
  )

quiz_question_5 =
  quiz.questions.find_or_create_by!(
    content: "test quiz question 5",
  )
quiz_question_5_correct_answer =
  quiz_question_5.correct_answer ||
  quiz_question_5.create_correct_answer(
    content: "test quiz correct answer",
  )
quiz_question_5_incorrect_answer_1 =
  quiz_question_5.incorrect_answers.find_or_create_by!(
    content: "test quiz incorrect answer 1",
  )
quiz_question_5_incorrect_answer_2 =
  quiz_question_5.incorrect_answers.find_or_create_by!(
    content: "test quiz incorrect answer 2",
  )
quiz_question_5_incorrect_answer_3 =
  quiz_question_5.incorrect_answers.find_or_create_by!(
    content: "test quiz incorrect answer 3",
  )
