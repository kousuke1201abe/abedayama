import VueApollo from 'vue-apollo'
import ApolloClient from "apollo-boost"
import { getApiUri } from '../uri';


const apolloClient = new ApolloClient({
  uri: `${getApiUri()}/public_api/graphql`,
  headers: {
    'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content'),
  },
});

const apolloProvider = new VueApollo({
  defaultClient: apolloClient
})

export default apolloProvider
