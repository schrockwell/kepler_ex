<template>
  <table class="table">
    <thead>
      <tr>
        <th>Sat</th>
        <th class="num">Az</th>
        <th class="num">El</th>
      </tr>
    </thead>
    <tbody>
      <tr v-if="positions.length == 0" class="text-muted">
        <td colspan="99">Loading…</td>
      </tr>
      <position-row v-for="p in positions" :position="p" />
    </tbody>
  </table>
</template>

<script>
  export default {
    components: {
      'PositionRow': require('./position-row')
    },

    props: ['socket', 'location'],

    data() {
      return {
        positions: [],
        channel: this.socket.channel('amsat:positions', { location: this.location })
      }
    },

    created() {
      this.channel.join()
        .receive('ok', initial => {
          this.positions = initial.positions
        })

      this.channel.on('positions', payload => {
        this.positions = payload.positions
      })
    },

    destroyed() {
      this.channel.leave()
    }
  }
</script>

<style>
  .num {
    text-align: right;
  }
</style>