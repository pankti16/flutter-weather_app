import 'package:flutter/material.dart';
import 'package:weather_app/common/wcolors.dart';

class DetailForecastItem extends StatelessWidget {
  final String itemDate;
  final int minTemperature;
  final int maxTemperature;
  final String weatherIcon;
  final String weatherName;
  final int chanceOfRain;

  const DetailForecastItem(
      {super.key,
      required this.itemDate,
      required this.minTemperature,
      required this.maxTemperature,
      required this.weatherIcon,
      required this.weatherName,
      required this.chanceOfRain});

  @override
  Widget build(BuildContext context) {
    final WColors _colors = WColors();

    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  itemDate,
                  style: const TextStyle(
                    color: Color(0xff6696f5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            minTemperature.toString(),
                            style: TextStyle(
                              color: _colors.greyColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          'o',
                          style: TextStyle(
                              color: _colors.greyColor,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600,
                              fontFeatures: const [
                                FontFeature.enable('sups'),
                              ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            maxTemperature.toString(),
                            style: TextStyle(
                              color: _colors.blackColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          'o',
                          style: TextStyle(
                              color: _colors.blackColor,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600,
                              fontFeatures: const [
                                FontFeature.enable('sups'),
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/$weatherIcon',
                      width: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      weatherName,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${chanceOfRain.toString()}%',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'assets/lightrain.png',
                      width: 30,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
