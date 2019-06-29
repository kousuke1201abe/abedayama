import Vue from 'vue'
import RootIndex from './rootIndex.vue'

new Vue({
  el: '#app',
  components: {
    RootIndex // これでViewファイル内では<root-index />で呼べます。
  }
})
