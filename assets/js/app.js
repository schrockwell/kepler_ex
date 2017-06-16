// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Need to impot here to make available to Vue components
import {Socket} from "phoenix"

// App stuff
import format from "./format"

// Create the root application
import Vue from "vue"
import Root from "../components/root.vue"

new Vue({
  el: '#app',
  render: function (createElement) {
    return createElement(Root)
  }
})