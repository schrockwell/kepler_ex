<template>
  <div class="container-fluid">
    <nav class="navbar navbar-toggleable-md navbar-inverse bg-primary">
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <router-link class="nav-link" active-class="active" exact to="/">Current</router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" active-class="active" exact to="/passes">Upcoming</router-link>
          </li>
        </ul>
        <span class="navbar-text">
          {{this.utc}} UTC
        </span>
      </div>
    </nav>

    <router-view></router-view>
  </div>
</template>

<script>
  import format from '../js/format'

  export default {
    data() {
      return {
        now: new Date(),
      }
    },

    computed: {
      utc() {
        return format.utcTime(this.now)
      }
    },

    created() {
      this.$store.state.socket.connect()

      const positionChannel = this.$store.state.socket.channel('amsat:positions', { location: this.$store.state.location })
      positionChannel.join()
        .receive('ok', initial => {
          this.$store.commit('setInitialPositions', initial.positions)
        })
      positionChannel.on('positions', payload => {
        this.$store.commit('setPositions', payload.positions)
      })

      const passesChannel = this.$store.state.socket.channel('amsat:passes', { location: this.$store.state.location })
      passesChannel.join()
      passesChannel.on('calculating', () => {
        this.$store.commit('clearPasses')
      })
      passesChannel.on('passes', payload => {
        this.$store.commit('setPasses', payload.passes)
      })

      setInterval(() => {
        this.now = new Date()
      }, 1000)
    },

    destroyed() {
      this.$store.state.socket.disconnect()
    },
  }
</script>

<style scoped>
  .container-fluid {
    padding: 0;
    height: 100%;
    min-height: 100%;
  }
</style>