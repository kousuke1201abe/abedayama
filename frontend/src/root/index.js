import Vue from 'vue';
import Vuetify from 'vuetify';
import 'vuetify/dist/vuetify.min.css';
import 'material-design-icons-iconfont/dist/material-design-icons.css'
import '@mdi/font/css/materialdesignicons.css'
import VueApollo from 'vue-apollo'
import ApolloClient from "apollo-boost"
import config from '../../config/environments';
import HelloWorld from './components/HelloWorld.vue';
import router from '../router.js';
import VueRouter from 'vue-router'

Vue.use(VueApollo)
Vue.use(Vuetify)
Vue.use(VueRouter)

const apolloClient = new ApolloClient({
  uri: `${config.API_URI}/public_api/graphql`,
  headers: {
    'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content'),
  },
});

const apolloProvider = new VueApollo({
  defaultClient: apolloClient
})

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    router,
    apolloProvider,
    el: '#root',
    components: { HelloWorld },
    template: '<hello-world></hello-world>',
  })
})
