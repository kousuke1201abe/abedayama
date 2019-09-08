import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Quiz from './console/components/Quiz.vue';
import Index from './console/components/Index.vue';

Vue.use(VueRouter)

const routes = [
  { path: '/', component: Index },
  { path: '/quiz/:urlCode', name: 'quiz', component: Quiz }
];

const router = new VueRouter({
  routes,
  mode: 'history'
});

export default router;
