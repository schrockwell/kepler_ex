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
import PositionsTable from "../components/PositionsTable"

Vue.config.productionTip = false
Vue.use(VueResource)
Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'positions',
      component: PositionsTable,
    }
  ],
})

new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})