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
          {{this.utc}}
        </span>
      </div>
    </nav>

    <router-view 
      :positions="positions"
      :previousPositions="previousPositions">
    </router-view>
  </div>
</template>

<script>
  import {Socket} from "phoenix"

  export default {
    data() {
      return {
        socket: new Socket("/socket"),
        location: {
          coord: [41.8612793, -72.1248892] // Hardcoded for my location
        },
        now: new Date(),
        positions: [],
        previousPositions: []
      }
    },

    computed: {
      utc() {
        return ('00' + this.now.getUTCHours()).slice(-2) 
          + ':' + ('00' + this.now.getUTCMinutes()).slice(-2)
          + ':' + ('00' + this.now.getUTCSeconds()).slice(-2)
          + ' UTC'
      }
    },

    created() {
      this.socket.connect()

      const positionChannel = this.socket.channel('amsat:positions', { location: this.location })

      positionChannel.join()
        .receive('ok', initial => {
          this.previousPositions = []
          this.positions = initial.positions
        })

      positionChannel.on('positions', payload => {
        this.previousPositions = this.positions
        this.positions = payload.positions
      })

      setInterval(() => {
        this.now = new Date()
      }, 1000)
    },

    destroyed() {
      this.socket.disconnect()
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