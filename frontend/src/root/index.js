import Vue from 'vue';
import Vuetify from 'vuetify';
import 'vuetify/dist/vuetify.min.css';
import 'material-design-icons-iconfont/dist/material-design-icons.css'
import '@mdi/font/css/materialdesignicons.css'
import { createProvider } from 'vue-apollo'
import HelloWorld from './components/HelloWorld.vue';

Vue.config.productionTip = false

Vue.use(Vuetify)

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    apolloProvider: createProvider(),
    el: '#root',
    components: { HelloWorld },
    template: '<hello-world></hello-world>'
  })
})
