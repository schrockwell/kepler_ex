<template>
  <tr :class="rowClass">
    <th>{{position.sat.name}}</th>
    <td class="num">{{this.az}}</td>
    <td class="text-muted">{{this.azCardinal}}</td>
    <td class="num">{{this.el}}</td>
    <td :class="direction">{{this.arrow}}</td>
    <td class="num">{{this.position.range.toFixed()}} km</td>
  </tr>
</template>

<script>
  import format from "../js/format"

  export default {
    props: ['position', 'previousPosition'],

    computed: {
      rowClass() {
        return this.position.el > 0 ? "success" : null
      },

      az() {
        return format.degrees(this.position.az)
      },

      el() {
        return format.degrees(this.position.el)
      },

      azCardinal() {
        return format.cardinal(this.position.az)
      },

      direction() {
        if (this.position && this.previousPosition) {
          if (this.previousPosition.el < this.position.el) {
            return 'up'
          } else {
            return 'down'
          }
        } else {
          return null
        }
      },

      arrow() {
        switch (this.direction) {
          case 'up': return '⬆'
          case 'down': return '⬇'
          default: return '–'
        }
      },
    }
  }
</script>

<style scoped>
  td.up { color: #0a0; }
  td.down { color: #c00; }
</style>