import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Test from './root/components/Test.vue';
import Tester from './root/components/Tester.vue';
import Index from './root/components/HelloWorld.vue';

Vue.use(VueRouter)

const routes = [
  { path: '/', component: Index },
  { path: '/test', component: Tester },
  { path: '/tester', component: Test }
];

const router = new VueRouter({
  routes,
  mode: 'history'
});

export default router;
