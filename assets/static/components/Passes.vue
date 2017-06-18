<template>
  <div style="height: 100%; overflow-y: auto">
    <button class="btn btn-primary" @click="refreshPasses">Refresh</button>
    <passes-table></passes-table>
  </div>
</template>

<script>
  import PassesTable from './PassesTable'

  export default {
    components: {PassesTable},

    methods: {
      refreshPasses() {
        this.$store.state.passChannel.push('refresh')
      }
    }
  }
</script>