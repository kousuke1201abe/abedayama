import Vue from 'vue';
import Vuetify from 'vuetify';
import 'vuetify/dist/vuetify.min.css';
import 'material-design-icons-iconfont/dist/material-design-icons.css'
import '@mdi/font/css/materialdesignicons.css'
import VueApollo from 'vue-apollo'
import App from './components/App.vue';
import router from '../router.js';
import VueRouter from 'vue-router'
import apolloProvider from '../common/api/graphql/apolloClient.js'

Vue.use(VueApollo)
Vue.use(Vuetify)
Vue.use(VueRouter)

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    router,
    apolloProvider,
    el: '#app',
    components: { App },
    template: '<app></app>',
  })
})
