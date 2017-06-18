<template>
  <div>
    <div v-if="passes.length === 0" class="text-muted loading">
      Loading…
    </div>
    <div v-if="passes.length > 0">
      <table class="table">
        <thead>
          <tr>
            <th>Sat</th>
            <th class="num">Peak</th>
            <th class="num br">Duration</th>
            <th class="br text-center" colspan="3">AOS</th>
            <th class="br text-center" colspan="3">Max</th>
            <th class="br text-center" colspan="3">LOS</th>
          </tr>
        </thead>
        <tbody>
          <pass-row
            v-for="p in passes"
            :key="p.at + '-' + p.sat.id"
            :pass="p"></pass-row>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
  import PassRow from './PassRow'

  export default {
    components: {PassRow},
    computed: {
      passes() {
        return this.$store.state.passes
      }
    }
  }
</script>

<style scoped>
  .loading {
    padding: 20px;
  }
</style>
