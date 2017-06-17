<template>
  <div class="row">
    <div class="col-md-4">
      <positions-table :positions="positions" :previousPositions="previousPositions"></positions-table>
    </div>
    <div class="col-md-8">
      Map here
    </div>
  </div>
</template>

<script>
  import PositionsTable from './PositionsTable'

  export default {
    components: {PositionsTable},
    props: ['positions', 'previousPositions']
  }
</script>