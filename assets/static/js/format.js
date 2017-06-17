const compassPoints = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']

export default {
  degrees(deg, precision) {
    return deg.toFixed(precision === undefined ? 1 : precision) + "°"
  },

  cardinal(deg) {
    const index = Math.floor(deg / 360 * compassPoints.length)
    return compassPoints[index]
  }
}
