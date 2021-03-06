var CopyWebpackPlugin = require("copy-webpack-plugin");
var ExtractTextPlugin = require("extract-text-webpack-plugin");
var utils = require('./utils');
var path = require('path');
var webpack = require("webpack");

module.exports = {
  entry: "./static/js/app.js",
  output: {
    path: path.resolve("../priv/static/js"),
    filename: "app.js"
  },
  module: {
    rules: [
      {
        test: /\.vue$/,
        loader: 'vue-loader',
        options: {
          loaders: utils.cssLoaders({
            sourceMap: true,
            extract: true
          })
        }
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader'
      },
      {
        test: /\.(png|jpe?g|gif|svg)(\?.*)?$/,
        loader: 'url-loader',
        options: {
          limit: 10000,
          name: utils.assetsPath('img/[name].[hash:7].[ext]')
        }
      },
      {
        test: /\.(woff2?|eot|ttf|otf)(\?.*)?$/,
        loader: 'url-loader',
        options: {
          limit: 10000,
          name: utils.assetsPath('fonts/[name].[hash:7].[ext]')
        }
      },
      {test: /\.css$/, use: ['style-loader', 'css-loader']},
      {test: /\.scss$/, use: ['style-loader','css-loader','sass-loader']},
    ]
  },
  resolve: {
    extensions: ['*', '.js', '.vue', '.json'],
    modules: [ "node_modules", __dirname + "/static/js" ],
    alias: {
      vue: 'vue/dist/vue.js'
    }
  },
  plugins: [
    new ExtractTextPlugin("../css/app.css"),
    new CopyWebpackPlugin([{from: "./static/assets", to: "../"}]),
    new webpack.ProvidePlugin({ // inject ES5 modules as global vars
      $: 'jquery',
      jQuery: 'jquery',
      'window.jQuery': 'jquery',
      Tether: 'tether'
    }),
    new webpack.DefinePlugin({
      'process.env': {
        'KEPLER_GOOGLE_MAPS_API_KEY': JSON.stringify(process.env.KEPLER_GOOGLE_MAPS_API_KEY)
      }
    })
  ]
}