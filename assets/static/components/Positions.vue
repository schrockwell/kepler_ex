<template>
  <div class="row">
    <div class="col-md-4">
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

  export default {
    components: {PositionsTable, PositionsMap},
  }
</script>