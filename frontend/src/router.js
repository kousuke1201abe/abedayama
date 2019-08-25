import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Test from './console/components/Test.vue';
import Index from './console/components/Index.vue';

Vue.use(VueRouter)

const routes = [
  { path: '/', component: Index },
  { path: '/tester', component: Test }
];

const router = new VueRouter({
  routes,
  mode: 'history'
});

export default router;
