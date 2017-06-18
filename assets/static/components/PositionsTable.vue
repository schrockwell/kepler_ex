<template>
  <div class="d-flex" style="overflow-y: scroll">
    <table class="table">
      <tbody>
        <tr v-if="$store.state.positions.length == 0" class="text-muted">
          <td colspan="99">Loading…</td>
        </tr>
        <position-row 
          v-for="(p, i) in $store.state.positions"
          :key="p.sat.id"
          :position="p"
          :previous-position="$store.state.previousPositions[i]"
          :selected="$store.state.trackingSatId === p.sat.id"
          @click.native="$store.commit('trackSatId', p.sat.id)">
        </position-row>
      </tbody>
    </table>
  </div>
</template>

<script>
  import PositionRow from './PositionRow'

  export default {
    components: {PositionRow},
  }
</script>

<style scoped>
  tbody tr:hover {
    background-color: #eee;
    cursor: pointer;
  }
</style>