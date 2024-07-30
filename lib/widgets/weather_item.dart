import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  final int value;
  final String unit;
  final String iconUrl;

  const WeatherItem({super.key, required this.value, required this.unit, required this.iconUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0,),
          height: 55.0,
          width: 55.0,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15.0,),
          ),
          child: Image.asset(iconUrl,),
        ),
        const SizedBox(
          height: 3.0,
        ),
        Text('${value.toString()}$unit', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.0,),),
      ],
    );
  }
}
