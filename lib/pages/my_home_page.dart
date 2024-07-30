import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app/common/utils.dart';
import 'package:weather_app/widgets/air_quality_item.dart';

import 'package:weather_app/widgets/forecast_list_wrapper.dart';
import 'package:weather_app/widgets/home_header.dart';
import 'package:weather_app/widgets/main_temperature_item.dart';

import '/common/wconstants.dart';
import '/common/wcolors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _locationController = TextEditingController();
  final WColors _colors = WColors();
  final WConstants _constants = WConstants();

  String location = 'Surat';
  String weatherIcon = 'heavycloudy.png';
  int temperature = 0;
  int humidity = 0;
  int windSpeed = 0;
  int cloud = 0;
  String currentDate = '';
  String currentWeatherStatus = '';
  List hourlyWeatherForecast = [];
  List dailyWeatherForecast = [];

  void getWeatherData(String searchText) async {
    try {
      var data = await http
          .get(Uri.parse('${_constants.searchWeatherAPI}$searchText'));
      final weatherData =
          Map<String, dynamic>.from(json.decode(data.body) ?? 'No Data');
      var locationData = weatherData['location'];
      var currentWeather = weatherData['current'];
      var parsedDate =
          DateTime.parse(locationData['localtime'].substring(0, 10));
      var newDate = DateFormat('MMMM EEE d').format(parsedDate);
      setState(() {
        location = getShortLocationName(locationData['name']);
        currentDate = newDate;
        currentWeatherStatus = currentWeather['condition']['text'];
        weatherIcon =
            '${currentWeatherStatus.replaceAll(" ", "").toLowerCase()}.png';
        temperature = currentWeather['temp_c'].toInt();
        humidity = currentWeather['humidity'].toInt();
        windSpeed = currentWeather['wind_kph'].toInt();
        cloud = currentWeather['cloud'].toInt();
        dailyWeatherForecast = weatherData['forecast']['forecastday'];
        hourlyWeatherForecast = dailyWeatherForecast[0]['hour'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getWeatherData(location);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.only(
          top: 40,
          left: 10,
          right: 10,
        ),
        color: _colors.primaryColor.withOpacity(0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              height: size.height * .65,
              decoration: BoxDecoration(
                gradient: _colors.linearGradientBlue,
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _colors.primaryColor.withOpacity(0.6),
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HomeHeader(location: location, locationController: _locationController, getWeatherData: getWeatherData,),
                  SizedBox(
                    height: 95.0,
                    child: Image.asset('assets/$weatherIcon'),
                  ),
                  MainTemperatureItem(temperature: temperature,),
                  Text(
                    currentWeatherStatus,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    currentDate,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16.0,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: const Divider(
                      color: Colors.white70,
                    ),
                  ),
                  AirQualityItem(windSpeed: windSpeed, humidity: humidity, cloudy: cloud,),
                ],
              ),
            ),
            ForecastListWrapper(dailyWeatherForecast: dailyWeatherForecast, hourlyWeatherForecast: hourlyWeatherForecast,),
          ],
        ),
      ),
    );
  }
}
