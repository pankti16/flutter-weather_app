import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:weather_app/common/utils.dart';
import 'package:weather_app/common/wcolors.dart';
import 'package:weather_app/widgets/air_quality_item.dart';
import 'package:weather_app/widgets/detail_forecast_item.dart';
import 'package:weather_app/widgets/main_temperature_item.dart';

class WeatherDetailPage extends StatelessWidget {
  final List dailyWeatherForecast;

  WeatherDetailPage({super.key, required this.dailyWeatherForecast});

  final WColors _colors = WColors();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var firstData = getForecastWeather(dailyWeatherForecast, 0);

    return Scaffold(
      backgroundColor: _colors.primaryColor,
      appBar: AppBar(
        title: const Text(
          'Forecasts',
        ),
        centerTitle: true,
        backgroundColor: _colors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
            ),
            child: IconButton(
              onPressed: () => debugPrint('Settings Tapped!'),
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: size.height * .75,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    right: 20,
                    left: 20,
                    child: Container(
                      height: 250,
                      width: size.width * .7,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.center,
                          colors: [
                            Color(0xffa9c1f5),
                            Color(0xff6696f5),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(.1),
                            offset: const Offset(0, 25),
                            blurRadius: 3,
                            spreadRadius: -10,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/${firstData["weatherIcon"]}',
                                      height: 80.0,
                                      width: 80.0,
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      firstData["weatherName"],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                                MainTemperatureItem(
                                  temperature:
                                  firstData["maxTemperature"],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            width: size.width * .8,
                            child: AirQualityItem(
                              padding: 20.0,
                              windSpeed: firstData["maxWindSpeed"],
                              humidity: firstData["avgHumidity"],
                              cloudy: firstData["chanceOfRain"],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 230,
                    left: 20.0,
                    child: SizedBox(
                      height: 400,
                      width: size.width * .9,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 180.0,),
                        itemCount: dailyWeatherForecast.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) =>
                            DetailForecastItem(
                          itemDate: getForecastWeather(dailyWeatherForecast, index)["forecastDate"],
                          minTemperature:
                              getForecastWeather(dailyWeatherForecast, index)["minTemperature"],
                          maxTemperature:
                              getForecastWeather(dailyWeatherForecast, index)["maxTemperature"],
                          weatherIcon: getForecastWeather(dailyWeatherForecast, index)["weatherIcon"],
                          weatherName: getForecastWeather(dailyWeatherForecast, index)["weatherName"],
                          chanceOfRain:
                              getForecastWeather(dailyWeatherForecast, index)["chanceOfRain"],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
