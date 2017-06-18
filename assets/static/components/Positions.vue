<template>
  <div class="row">
    <div class="col-md-4">
      <sat-info :satId="$store.state.trackingSatId"></sat-info>
      <positions-table></positions-table>
    </div>
    <div class="col-md-8">
      <positions-map></positions-map>
    </div>
  </div>
</template>

<script>
  import PositionsTable from './PositionsTable'
  import PositionsMap from './PositionsMap'
  import SatInfo from './SatInfo'

  export default {
    components: {PositionsTable, PositionsMap, SatInfo},
  }
</script>