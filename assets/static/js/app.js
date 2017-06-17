//
// THIRD-PARTY
//
import "phoenix_html"
import 'bootstrap'
import Vue from 'vue'
import VueResource from 'vue-resource'
import VueRouter from 'vue-router'

//
// STYLES
//
import '../css/app.scss'

//
// VUE APP
//
import App from "../components/App"
import Positions from "../components/Positions"
import Passes from "../components/Passes"

Vue.config.productionTip = false
Vue.use(VueResource)
Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'positions',
      component: Positions,
    },
    {
      path: '/passes',
      name: 'passes',
      component: Passes,
    },
  ],
})

new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})