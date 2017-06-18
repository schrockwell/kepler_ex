<template>
  <gmap-map 
    style="width: 100%; min-height: 100%"
    :center="center"
    :zoom="2">
    
    <gmap-marker
      v-for="p in $store.state.positions"
      :key="p.sat.id"
      :position="{lat: p.lat, lng: p.lon}"
      :title="p.sat.name"
      @click="$store.commit('trackSatId', p.sat.id)"
      :icon="{url: '/images/satellite.png', scaledSize: {width: 40, height: 40}, anchor: {x: 20, y: 20}}"></gmap-marker>

    <gmap-circle
      v-if="$store.getters.trackedPosition"
      :center="{lat: $store.getters.trackedPosition.lat, lng: $store.getters.trackedPosition.lon}"
      :radius="$store.getters.trackedPosition.footprint_radius * 1000"
      :options="{strokeColor: '#c00', fillColor: '#c00'}"></gmap-circle>
  </gmap-map>
</template>

<script>
  import * as VueGoogleMaps from 'vue2-google-maps'
  import Vue from 'vue'

  Vue.use(VueGoogleMaps, {
    load: {
      key: 'AIzaSyAeSpr-2gJxJWY6n5SOoML0OIW0SsTuhx4'
    }
  })

  export default {
    data() {
      return {
        center: {lat: 0, lng: 0},
      }
    },
  }
</script>