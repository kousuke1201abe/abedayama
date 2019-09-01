import gql from 'graphql-tag'

const createQuizGql = gql`
  mutation CreateQuiz(
    $name: String!
  ) {
    createQuiz(
      input: {
        name: $name
      }
    ) {
      quiz {
        name
      }
    }
  }
`;

export default createQuizGql;
