import Vue from 'vue'
import Vuex from 'vuex'
import {Socket} from "phoenix"

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    positions: [],
    previousPositions: [],
    passes: [],
    location: {
      // coord: [41.8612793, -72.1248892] // WW1X
      coord: [42.0759329, -72.5966875] // HCRA Field Day
    },
    trackingSatId: null,
    socket: new Socket("/socket"),
    passChannel: null,
    positionChannel: null,
    now: new Date()
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
      if (state.trackingSatId == satId) {
        state.trackingSatId = null
      } else {
        state.trackingSatId = satId
      }
    },

    clearPasses(state) {
      state.passes = []
    },

    setPasses(state, newPasses) {
      state.passes = newPasses
    },

    tick(state) {
      state.now = new Date()
    }
  },

  getters: {
    positionsObject(state) {
      let obj = {}
      for (var i = 0; i < state.positions.length; i++) {
        obj[state.positions[i].sat.id] = state.positions[i]
      }
      return obj
    },

    trackedPosition(state, getters) {
      return getters.positionsObject[state.trackingSatId]
    }
  }
})