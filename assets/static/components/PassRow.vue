<template>
  <tr :class="rowClass">
    <th>{{this.pass.sat.name}}</th>
    <td class="num">{{maxEl}}</th>
    <td class="num br">{{duration}}</th>

    <td>{{aosUTC}}</td>
    <td class="num">{{aosAz}}</td>
    <td class="br">{{aosCardinal}}</td>

    <td>{{maxUTC}}</td>
    <td class="num">{{maxAz}}</td>
    <td class="br">{{maxCardinal}}</td>

    <td>{{losUTC}}</td>
    <td class="num">{{losAz}}</td>
    <td class="br">{{losCardinal}}</td>
  </tr>
</template>

<script>
  import format from '../js/format'

  export default {
    props: ['pass'],
    computed: {
      rowClass() {
        if (this.pass.los.at < Date.now() / 1000) {
          return 'text-muted'
        } else if (this.pass.aos.at < Date.now() / 1000 && this.pass.los.at > Date.now() / 1000) {
          return 'table-success'
        } else {
          return null
        }
      },

      duration() {
        return format.interval(this.pass.los.at - this.pass.aos.at)
      },

      aosUTC() {
        const date = new Date(this.pass.aos.at * 1000)
        return format.utcDate(date) + ' ' + format.utcTime(date)
      },

      aosAz() {
        return format.degrees(this.pass.aos.az)
      },

      aosCardinal() {
        return format.cardinal(this.pass.aos.az)
      },

      maxUTC() {
        const date = new Date(this.pass.max.at * 1000)
        return format.utcDate(date) + ' ' + format.utcTime(date)
      },

      maxAz() {
        return format.degrees(this.pass.max.az)
      },

      maxEl() {
        return format.degrees(this.pass.max.el)
      },

      maxCardinal() {
        return format.cardinal(this.pass.max.az)
      },

      losUTC() {
        const date = new Date(this.pass.los.at * 1000)
        return format.utcDate(date) + ' ' + format.utcTime(date)
      },

      losAz() {
        return format.degrees(this.pass.los.az)
      },

      losCardinal() {
        return format.cardinal(this.pass.los.az)
      },
    }
  }
</script>