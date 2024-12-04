package com.kaesik.weatherapp.data.remote

data class WeatherResponse(
    val current: CurrentWeather,
    val hourly: List<HourlyWeather>,
    val daily: List<DailyWeather>
)

data class CurrentWeather(
    val dt: Long,
    val sunrise: Long,
    val sunset: Long,
    val temp: Double,
    val pressure: Int,
    val humidity: Int,
    val windSpeed: Double,
    val weather: List<Weather>,
)

data class HourlyWeather(
    val dt: Long,
    val temp: Double,
    val pressure: Int,
    val humidity: Int,
    val windSpeed: Double,
    val weather: List<Weather>
)

data class DailyWeather(
    val dt: Long,
    val sunrise: Long,
    val sunset: Long,
    val moonrise: Long,
    val moonset: Long,
    val summary: String,
    val temp: Temp,
    val pressure: Int,
    val humidity: Int,
    val windSpeed: Double,
    val weather: List<Weather>
)

data class Weather(
    val id: Int,
    val main: String,
    val description: String,
    val icon: String
)

data class Temp(
    val day: Double,
    val min: Double,
    val max: Double,
    val night: Double,
    val eve: Double,
    val morn: Double
)
