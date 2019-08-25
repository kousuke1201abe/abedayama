import VueApollo from 'vue-apollo'
import ApolloClient from "apollo-boost"
import config from '../../../../config/environments'

const apolloClient = new ApolloClient({
  uri: `${config.API_URI}/public_api/graphql`,
  headers: {
    'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content'),
  },
});

const apolloProvider = new VueApollo({
  defaultClient: apolloClient
})

export default apolloProvider
