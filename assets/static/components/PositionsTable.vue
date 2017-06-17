<template>
  <table class="table">
    <tbody>
      <tr v-if="positions.length == 0" class="text-muted">
        <td colspan="99">Loading…</td>
      </tr>
      <position-row 
        v-for="(p, i) in positions"
        :key="p.sat.id"
        :position="p"
        :previous-position="previousPositions[i]"
        :selected="selectedId === p.sat.id"
        @click.native="selectedId = p.sat.id">
      </position-row>
    </tbody>
  </table>
</template>

<script>
  import PositionRow from './PositionRow'

  export default {
    components: {PositionRow},

    props: ['positions', 'previousPositions'],

    data() {
      return {
        selectedId: null
      }
    }
  }
</script>

<style scoped>
  tbody tr:hover {
    background-color: #eee;
    cursor: pointer;
  }
</style>