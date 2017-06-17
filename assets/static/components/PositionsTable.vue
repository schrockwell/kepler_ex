<template>
  <table class="table">
    <thead>
      <tr>
        <th>Sat</th>
        <th class="num">Az</th>
        <th></th>
        <th class="num">El</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr v-if="positions.length == 0" class="text-muted">
        <td colspan="99">Loading…</td>
      </tr>
      <position-row v-for="(p, i) in positions" :position="p" :previous-position="previousPositions[i]" :key="p.sat.id"></position-row>
    </tbody>
  </table>
</template>

<script>
  import PositionRow from './PositionRow'

  export default {
    components: {PositionRow},

    props: ['socket', 'location'],

    data() {
      return {
        previousPositions: [],
        positions: [],
        channel: this.socket.channel('amsat:positions', { location: this.location })
      }
    },

    created() {
      this.channel.join()
        .receive('ok', initial => {
          this.previousPositions = []
          this.positions = initial.positions
        })

      this.channel.on('positions', payload => {
        this.previousPositions = this.positions
        this.positions = payload.positions
      })
    },

    destroyed() {
      this.channel.leave()
    }
  }
</script>

<style scoped>
  tbody tr:hover {
    background-color: #eee;
    cursor: pointer;
  }
</style>