import Vue from 'vue'
import VueRouter from 'vue-router'
import Positions from '../components/Positions'
import Passes from '../components/Passes'

Vue.use(VueRouter)

export default new VueRouter({
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