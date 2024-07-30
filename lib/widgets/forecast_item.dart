import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/common/wcolors.dart';

class ForecastItem extends StatelessWidget {
  final item;
  const ForecastItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final WColors _colors = WColors();

    String currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    String currentHour = currentTime.substring(0, 2);
    String forecastTime = item['time'].substring(11, 16);
    String forecastHour = forecastTime.substring(0, 2);
    String forecastWeatherName = item['condition']['text'];
    String forecastWeatherIcon =
        '${forecastWeatherName.replaceAll(' ', '').toLowerCase()}.png';
    String forecastTemperature = item['temp_c'].round().toString();

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      margin: const EdgeInsets.only(
        right: 20.0,
      ),
      width: 60.0,
      decoration: BoxDecoration(
        color:
            currentHour == forecastHour ? _colors.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(
          50.0,
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 5,
            color: _colors.primaryColor.withOpacity(0.2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            forecastTime,
            style: TextStyle(
              fontSize: 12.0,
              color: _colors.greyColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/$forecastWeatherIcon',
              height: 15.0,
              width: 15.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$forecastTemperature\u1d3c',
                style: TextStyle(
                  fontSize: 12.0,
                  color: _colors.greyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
