<template>
  <gmap-map 
    style="width: 100%; min-height: 100%"
    :center="center"
    :zoom="2">
    
    <gmap-marker
      v-for="p in positions"
      :key="p.sat.id"
      :position="{lat: p.lat, lng: p.lon}"
      :title="p.sat.name"
      @click="$store.commit('trackSatId', p.sat.id)"
      :icon="{url: '/images/satellite.png', scaledSize: {width: 40, height: 40}, anchor: {x: 20, y: 20}}"></gmap-marker>

    <position-map-circle
      v-for="p in positions"
      :key="p.sat.id"
      :position="p"></position-map-circle>
  </gmap-map>
</template>

<script>
  import * as VueGoogleMaps from 'vue2-google-maps'
  import Vue from 'vue'
  import PositionMapCircle from './PositionMapCircle'

  Vue.use(VueGoogleMaps, {
    load: {
      key: 'AIzaSyAeSpr-2gJxJWY6n5SOoML0OIW0SsTuhx4'
    }
  })

  export default {
    components: {PositionMapCircle},

    data() {
      return {
        center: {lat: 30, lng: 0},
      }
    },

    computed: {
      positions() {
        return this.$store.state.positions
      },
    }
  }
</script>