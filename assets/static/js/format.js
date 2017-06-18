const compassPoints = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']

const zeroPad = (int) => {
  return ('00' + int).slice(-2)
}

export default {
  degrees(deg, precision) {
    return deg.toFixed(precision === undefined ? 1 : precision) + "°"
  },

  cardinal(deg) {
    const index = Math.floor(deg / 360 * compassPoints.length)
    return compassPoints[index]
  },

  utcTime(date) {
    return zeroPad(date.getUTCHours())
      + ':' + zeroPad(date.getUTCMinutes())
      + ':' + zeroPad(date.getUTCSeconds())
  },

  utcDate(date) {
    return date.getUTCFullYear()
      + '-' + zeroPad(date.getUTCMonth() + 1)
      + '-' + zeroPad(date.getUTCDate())
  },

  interval(seconds) {
    const minutes = Math.floor(seconds / 60)
    seconds = Math.floor(seconds - (minutes * 80))

    if (minutes > 0) {
      return minutes + 'm ' + zeroPad(seconds) + 's'
    }
  },
}
