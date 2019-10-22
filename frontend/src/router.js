import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Quiz from './console/components/Quiz.vue';
import Index from './console/components/Index.vue';
import QuizComplete from './console/components/QuizComplete.vue';

Vue.use(VueRouter)

const routes = [
  { path: '/', name: 'top', component: Index },
  { path: '/quiz/:urlCode', name: 'quiz', component: Quiz },
  { path: '/quiz/:urlCode/complete', name: 'quizComplete', component: QuizComplete }
];

const router = new VueRouter({
  routes,
  mode: 'history'
});

export default router;
