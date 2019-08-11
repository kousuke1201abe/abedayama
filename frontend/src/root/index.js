import Vue from 'vue';
import Vuetify from 'vuetify';
import 'vuetify/dist/vuetify.min.css';
import 'material-design-icons-iconfont/dist/material-design-icons.css'
import '@mdi/font/css/materialdesignicons.css'
import VueRouter from 'vue-router'
import VueApollo from 'vue-apollo'
import ApolloClient from "apollo-boost"
import HelloWorld from './components/HelloWorld.vue';

Vue.use(VueApollo)

Vue.use(VueRouter)

Vue.use(Vuetify)

const apolloClient = new ApolloClient({
  uri: "http://localhost:3000/public_api/graphql"
});

const apolloProvider = new VueApollo({
  defaultClient: apolloClient
})

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    apolloProvider,
    el: '#root',
    components: { HelloWorld },
    template: '<hello-world></hello-world>'
  })
})
