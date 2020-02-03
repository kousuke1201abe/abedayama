import gql from 'graphql-tag';

const getQuizGql = gql`
  query($urlCode: String!) {
    quiz(urlCode: $urlCode) {
      urlCode
      name
      imageUrl
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
