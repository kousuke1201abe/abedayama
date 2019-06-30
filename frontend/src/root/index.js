import Vue from 'vue';
import Vuetify from 'vuetify';
import 'vuetify/dist/vuetify.min.css';
import 'material-design-icons-iconfont/dist/material-design-icons.css'
import '@mdi/font/css/materialdesignicons.css'
import HelloWorld from './components/HelloWorld.vue';

Vue.use(Vuetify)

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#root',
    components: { HelloWorld },
    template: '<hello-world></hello-world>'
  })
})
