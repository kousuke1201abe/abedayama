import gql from 'graphql-tag'

const getQuizGql = gql`
  query($urlCode: String!) {
    quiz(urlCode: $urlCode) {
      urlCode
      name
      questions {
        content
        answers {
          content
        }
      }
    }
  }
`;

export default getQuizGql;
