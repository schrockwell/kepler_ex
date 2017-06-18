//
// THIRD-PARTY
//
import "phoenix_html"
import 'bootstrap'

//
// STYLES
//
import '../css/app.scss'

//
// VUE APP
//
import Vue from 'vue'
import App from "../components/App"
import router from './vue-router'
import store from './vuex-store'

Vue.config.productionTip = false
new Vue({
  el: '#app',
  router,
  store,
  template: '<App/>',
  components: { App }
})