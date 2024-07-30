import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_item.dart';

class AirQualityItem extends StatelessWidget {
  final int windSpeed;
  final int humidity;
  final int cloudy;
  final double? padding;
  const AirQualityItem({super.key, required this.windSpeed, required this.humidity, required this.cloudy, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padding ?? 40.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherItem(
            value: windSpeed,
            unit: 'km/h',
            iconUrl: 'assets/windspeed.png',
          ),
          WeatherItem(
            value: humidity,
            unit: '%',
            iconUrl: 'assets/humidity.png',
          ),
          WeatherItem(
            value: cloudy,
            unit: '%',
            iconUrl: 'assets/cloud.png',
          ),
        ],
      ),
    );
  }
}
