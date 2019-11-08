import gql from 'graphql-tag'

const getLatestQuizzesGql = gql`
  query {
    quizzes {
      name
      urlCode
    }
  }
`;

export default getLatestQuizzesGql;
