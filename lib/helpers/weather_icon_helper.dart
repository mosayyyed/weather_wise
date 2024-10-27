String getWeatherIcon(String weatherCode, bool isDayTime) {
  switch (weatherCode) {
    case "01d":
    case "01n":
      return isDayTime ? "day/sun.png" : "night/moon.png"; // clear sky
    case "02d":
    case "02n":
    case "03d":
    case "03n":
    case "04d":
    case "04n":
      return isDayTime ? "day/clouds.png" : "night/clouds.png"; // clouds
    case "09d":
    case "09n":
    case "10d":
    case "10n":
      return isDayTime ? "day/rain.png" : "night/rain.png"; // rain
    case "11d":
    case "11n":
      return isDayTime ? "day/storm.png" : "night/storm.png"; // thunderstorm
    case "13d":
    case "13n":
      return isDayTime ? "day/snow.png" : "night/snow.png"; // snow
    default:
      return isDayTime ? "day/sun.png" : "night/moon.png"; // default
  }
}
