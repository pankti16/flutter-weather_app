import 'package:flutter/material.dart';
import 'package:weather_app/common/wcolors.dart';
import 'package:weather_app/pages/weather_detail_page.dart';
import 'package:weather_app/widgets/forecast_item.dart';

class ForecastListWrapper extends StatelessWidget {
  final List dailyWeatherForecast;
  final List hourlyWeatherForecast;
  const ForecastListWrapper({super.key, required this.dailyWeatherForecast, required this.hourlyWeatherForecast});

  @override
  Widget build(BuildContext context) {
    final WColors _colors = WColors();
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      height: size.height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Today',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WeatherDetailPage(
                        dailyWeatherForecast: dailyWeatherForecast,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Forecast',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: _colors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          SizedBox(
            height: 100.0,
            child: ListView.builder(
                itemCount: hourlyWeatherForecast.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = hourlyWeatherForecast[index];
                  return ForecastItem(
                    item: item,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
