<template>
  <div class="sat-info">
    <div v-if="satId === null">
      <span class="text-muted">Select a satellite</span>
    </div>
    <div v-if="sat">
      <h3>{{sat.name}}</h3>
      <p class="text-muted">{{sat.notes}}</p>
      <ul>
        <li><b>Height:</b> {{position.height.toFixed()}} km</li>
        <li><b>Range:</b> {{position.range.toFixed()}} km</li>
      </ul>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['satId'],
    computed: {
      position() {
        return this.$store.getters.positionsObject[this.satId]
      },

      sat() {
        return this.position ? this.position.sat : null
      }
    }
  }
</script>

<style lang="scss" scoped>
  .sat-info {
    height: 200px;
    padding: 10px;
  }

  h3 {
    border-bottom: 2px solid #eee;
    padding-bottom: 5px;
  }
</style>