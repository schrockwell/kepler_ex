<template>
  <table class="table">
    <thead>
      <tr>
        <th>Sat</th>
        <th colspan="2">AOS</th>
        <th colspan="2">LOS</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="pass in passes">
        <th>{{pass.sat.name}}</th>
      </tr>
    </tbody>
  </table>
</template>

<script>
  export default {
    data() {
      return {
        passes: []
      }
    },

    computed: {
      futurePasses() {
        const now = Date.now()
        return this.passes.filter(pass => {
          return (pass.end_time / 1000) > now
        })
      }
    }
  }
</script>
