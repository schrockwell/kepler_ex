const compassPoints = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']

export default {
  degrees(deg) {
    return deg.toFixed(1) + "°"
  },

  cardinal(deg) {
    const index = Math.floor(deg / 360 * compassPoints.length)
    return compassPoints[index]
  }
}