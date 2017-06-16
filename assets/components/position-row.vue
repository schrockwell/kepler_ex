<template>
  <tr :class="rowClass">
    <th>{{position.sat.name}}</th>
    <td class="num">{{this.azFormatted}}</td>
    <td class="num">{{this.elFormatted}}</td>
  </tr>
</template>

<script>
  import format from "../js/format"

  export default {
    props: ['position'],

    computed: {
      rowClass() {
        return this.position.elevation_deg > 0 ? "success" : null
      },

      azFormatted() {
        return format.degrees(this.position.azimuth_deg)
      },

      elFormatted() {
        return format.degrees(this.position.elevation_deg)
      },
    }
  }
</script>