<template>
  <gmap-map 
    style="width: 100%; height: 500px"
    :center="center"
    :zoom="1">
    
    <gmap-marker
      v-for="p in $store.state.positions"
      :key="p.sat.id"
      :position="{lat: p.lat, lng: p.lon}"
      :title="p.sat.name"
      @click="markerClicked"></gmap-marker> 
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

    methods: {
      markerClicked(e) {
        alert('woo!')
      }
    },
  }
</script>