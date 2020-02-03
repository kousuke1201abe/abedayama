import gql from 'graphql-tag';

const getLatestQuizzesGql = gql`
  query {
    quizzes {
      imageUrl
      name
      urlCode
    }
  }
`;

export default getLatestQuizzesGql;
