package com.kaesik.weatherapp.domain.weather

import androidx.annotation.DrawableRes
import com.kaesik.weatherapp.R

sealed class WeatherType(
    val weatherDesc: String,
    @DrawableRes val iconRes: Int
) {
    data object ClearSkyDay : WeatherType (
        weatherDesc = "Clear sky",
        iconRes = R.drawable.clear_day
    )

    data object ClearSkyNight : WeatherType (
        weatherDesc = "Clear sky",
        iconRes = R.drawable.clear_night
    )

    data object DarkCloudy : WeatherType (
        weatherDesc = "Cloudy",
        iconRes = R.drawable.dark_cloudy
    )

    data object LightCloudy : WeatherType (
        weatherDesc = "Cloudy",
        iconRes = R.drawable.light_cloudy
    )

    data object DarkDrizzle : WeatherType (
        weatherDesc = "Drizzle",
        iconRes = R.drawable.dark_drizzle
    )

    data object LightDrizzle : WeatherType (
        weatherDesc = "Drizzle",
        iconRes = R.drawable.light_drizzle
    )

    data object DarkFog : WeatherType (
        weatherDesc = "Fog",
        iconRes = R.drawable.dark_fog
    )

    data object LightFog : WeatherType (
        weatherDesc = "Fog",
        iconRes = R.drawable.light_fog
    )

    data object DarkRain : WeatherType (
        weatherDesc = "Rain",
        iconRes = R.drawable.dark_rain
    )

    data object LightRain : WeatherType (
        weatherDesc = "Rain",
        iconRes = R.drawable.light_rain
    )

    data object DarkThunderstorm : WeatherType (
        weatherDesc = "Thunderstorm",
        iconRes = R.drawable.dark_tstorm
    )

    data object LightThunderstorm : WeatherType (
        weatherDesc = "Thunderstorm",
        iconRes = R.drawable.light_tstorm
    )

    data object DarkUnknown : WeatherType (
        weatherDesc = "Unknown",
        iconRes = R.drawable.dark_unknown
    )

    data object LightUnknown : WeatherType (
        weatherDesc = "Unknown",
        iconRes = R.drawable.light_unknown
    )

    data object DarkFewCloudsDay : WeatherType (
        weatherDesc = "Few clouds",
        iconRes = R.drawable.dark_fewcloudy_day
    )

    data object DarkFewCloudsNight : WeatherType (
        weatherDesc = "Few clouds",
        iconRes = R.drawable.dark_fewcloudy_night
    )

    data object LightFewCloudsDay : WeatherType (
        weatherDesc = "Few clouds",
        iconRes = R.drawable.light_fewcloudy_day
    )

    data object LightFewCloudsNight : WeatherType (
        weatherDesc = "Few clouds",
        iconRes = R.drawable.light_fewcloudy_night
    )

    data object DarkBrokenCloudsDay : WeatherType (
        weatherDesc = "Broken clouds",
        iconRes = R.drawable.dark_brokencloudy_day
    )

    data object DarkBrokenCloudsNight : WeatherType (
        weatherDesc = "Broken clouds",
        iconRes = R.drawable.dark_brokencloudy_night
    )

    data object LightBrokenCloudsDay : WeatherType (
        weatherDesc = "Broken clouds",
        iconRes = R.drawable.light_brokencloudy_day
    )

    data object LightBrokenCloudsNight : WeatherType (
        weatherDesc = "Broken clouds",
        iconRes = R.drawable.light_brokencloudy_night
    )

    companion object {
        fun fromOpenWeatherMapCode(code: Int, isDay: Boolean, isDarkTheme: Boolean): WeatherType {
            return when (code) {
                300, 301, 302, 310, 311, 312, 313, 314, 321 -> if (isDarkTheme) DarkDrizzle else LightDrizzle
                500, 501, 502, 503, 504 -> if (isDarkTheme) DarkRain else LightRain
                701, 741 -> if (isDarkTheme) DarkFog else LightFog
                800 -> if (isDay) ClearSkyDay else ClearSkyNight
                801 -> if (isDay) {
                    if (isDarkTheme) DarkFewCloudsDay else LightFewCloudsDay
                } else {
                    if (isDarkTheme) DarkFewCloudsNight else LightFewCloudsNight
                }
                802, 803 -> if (isDay) {
                    if (isDarkTheme) DarkBrokenCloudsDay else LightBrokenCloudsDay
                } else {
                    if (isDarkTheme) DarkBrokenCloudsNight else LightBrokenCloudsNight
                }
                804 -> if (isDarkTheme) DarkCloudy else LightCloudy
                200, 201, 202, 210, 211, 212, 221, 230, 231, 232 -> if (isDarkTheme) DarkThunderstorm else LightThunderstorm
                else -> if (isDarkTheme) DarkUnknown else LightUnknown
            }
        }
    }
}
