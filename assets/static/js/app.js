//
// THIRD-PARTY
//
import {Socket} from "phoenix"
import "phoenix_html"
import 'bootstrap'
import Vue from 'vue'
import Vuex from 'vuex'
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
Vue.use(Vuex)
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

const store = new Vuex.Store({
  state: {
    positions: [],
    previousPositions: [],
    location: {
      coord: [41.8612793, -72.1248892] // Hardcoded for my location
    },
    trackingSatId: null,
    socket: new Socket("/socket"),
  },

  mutations: {
    setPositions(state, newPositions) {
      state.previousPositions = state.positions
      state.positions = newPositions
    },

    setInitialPositions(state, positions) {
      state.previousPositions = []
      state.positions = positions
    },

    trackSatId(state, satId) {
      state.trackingSatId = satId
    }
  }
})

new Vue({
  el: '#app',
  router,
  store,
  template: '<App/>',
  components: { App }
})