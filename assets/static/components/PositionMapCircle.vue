<template>
  <gmap-circle
    :key="position.sat.id"
    :center="{lat: position.lat, lng: position.lon}"
    :radius="position.footprint_radius * 1000"
    :options="circleOptions"></gmap-circle>
</template>

<script>
  import * as VueGoogleMaps from 'vue2-google-maps'

  export default {
    props: ['position'],

    computed: {
      isTracking() {
        return this.position.sat.id == this.$store.state.trackingSatId
      },

      circleOptions() {
        let options = {
          strokeColor: '#fff',
          strokeOpacity: 0.7,
          fillColor: '#fff',
          fillOpacity: 0.2
        }

        if (this.isTracking) {
          options.strokeColor = '#c00'
          options.strokeOpacity = 1.0
          options.fillColor = '#c00'
          options.fillOpacity = 0.4
        }

        if (this.position.el > 0) {
          options.strokeColor = '#0c0'
          options.fillColor = '#0c0'
        }

        return options
      }
    }
  }
</script>