import 'package:flutter/material.dart';
import 'package:weather_app/common/wcolors.dart';

class MainTemperatureItem extends StatelessWidget {
  final int temperature;
  const MainTemperatureItem({super.key, required this.temperature});

  @override
  Widget build(BuildContext context) {
    final WColors _colors = WColors();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
          ),
          child: Text(
            temperature.toString(),
            style: TextStyle(
              fontSize: 45.0,
              fontWeight: FontWeight.bold,
              foreground: Paint()..shader = _colors.shader,
            ),
          ),
        ),
        Text(
          'O',
          style: TextStyle(
            fontSize: 22.5,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = _colors.shader,
          ),
        ),
      ],
    );
  }
}
