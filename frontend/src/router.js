import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Test from './root/components/Test.vue';
import Index from './root/components/HelloWorld.vue';

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/test',
      component: Test
    },
    {
      path: '/',
      component: Index
    }
  ]
})
