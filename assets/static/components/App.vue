<template>
  <div>
    <positions-table :location="location" :socket="socket"></positions-table>
  </div>
</template>

<script>
  import {Socket} from "phoenix"
  import PassesTable from "./PassesTable"
  import PositionsTable from "./PositionsTable"

  export default {
    components: { PassesTable, PositionsTable },

    data() {
      return {
        socket: new Socket("/socket"),
        location: {
          coord: [41.8612793, -72.1248892] // Hardcoded for my location
        },
      }
    },

    created() {
      this.socket.connect()
    },

    destroyed() {
      this.socket.disconnect()
    },
  }
</script>
