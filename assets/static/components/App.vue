<template>
  <div class="container-fluid">
    <nav class="navbar navbar-toggleable-md navbar-inverse bg-primary fixed-top">
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

    <div class="wrapper">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
  import format from '../js/format'

  export default {
    computed: {
      utc() {
        return format.utcTime(this.$store.state.now)
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

      const passChannel = this.$store.state.socket.channel('amsat:passes', { location: this.$store.state.location })
      passChannel.join()
      passChannel.on('calculating', () => {
        this.$store.commit('clearPasses')
      })
      passChannel.on('passes', payload => {
        this.$store.commit('setPasses', payload.passes)
      })

      this.$store.state.positionChannel = positionChannel
      this.$store.state.passChannel = passChannel
      
      setInterval(() => {
        this.$store.commit('tick')
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
  }

  .wrapper {
    height: 100%;
    padding-top: 51.38px;
  }
</style>