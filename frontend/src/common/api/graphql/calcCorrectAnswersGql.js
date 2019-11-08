import gql from 'graphql-tag'

const clacCorrectAnswersGql = gql`
  query($urlCode: String!, $answers: [String!]!) {
    quiz(urlCode: $urlCode) {
      urlCode
      name
      questions {
        content
        correctAnswer {
          content
        }
      }
      correctNum(answers: $answers)
    }
  }
`;

export default clacCorrectAnswersGql;
