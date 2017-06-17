<template>
  <tr :class="rowClass">
    <th>{{position.sat.name}}</th>
    <td class="num">{{this.az}}</td>
    <td class="text-muted">{{this.azCardinal}}</td>
    <td :class="elClass">{{this.el}}</td>
    <td :class="direction">{{this.arrow}}</td>
  </tr>
</template>

<script>
  import format from "../js/format"

  export default {
    props: ['position', 'previousPosition', 'selected'],

    computed: {
      rowClass() {
        return this.selected ? 'table-info' : null
      },

      az() {
        return format.degrees(this.position.az)
      },

      el() {
        return format.degrees(this.position.el)
      },

      elClass() {
        if (this.position.el > -5 && this.direction != 'down') {
          return 'num text-warning bold'
        } else if (this.position.el > 0) {
          return 'num text-success bold'
        } else {
          return 'num'
        }
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
  .bold {font-weight: bold;}
</style>